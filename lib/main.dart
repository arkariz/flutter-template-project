import 'dart:async';

import 'package:dio_request_inspector/dio_request_inspector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:project_template/data/base_service/interceptors/request_interceptor.dart';
import 'package:project_template/data/utility/data_dependecies_injection.dart';
import 'package:project_template/domain/module/book/repository/book_repository.dart';
import 'package:project_template/domain/module/book/request/request_book.dart';
import 'package:project_template/presentation/core/config/dart_define_config.dart';
import 'package:project_template/presentation/core/config/slang_config.dart';
import 'package:project_template/presentation/core/generated/i18n/translations.g.dart';
import 'package:project_template/presentation/flavor/flavor.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      
      DataDependenciesInjection.inject();
      await Flavor.initialize(DartDefineConfig.environment);

      // Initialze Chukker Interceptor
      final dioRequestInspector = DioRequestInspector(
        isDebugMode: true,
        showFloating: false,
      );
      setRequestInspector(requestInspector: dioRequestInspector);

      final appWithInspector = DioRequestInspectorMain(inspector: dioRequestInspector, child: const MyApp());

      // Slang
      LocaleSettings.useDeviceLocale();
      final appWithSlang = TranslationProvider(child: appWithInspector);

      runApp(appWithSlang);
    }, 
    (error, stackTrace) {}
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorObservers: [
        DioRequestInspector.navigatorObserver,
      ],
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BookRepository repository = GetIt.I<BookRepository>();

  void _changeLocale() async {
    LocaleSettings.setLocale(AppLocale.id);
    final request = RequestBook();
    await repository.getBooks(request);
  }

  @override
  Widget build(BuildContext context) {
    SlangConfig.instance.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              slang.example.hello,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeLocale,
        tooltip: slang.example.hello,
        child: const Icon(Icons.add),
      ),
    );
  }
}
