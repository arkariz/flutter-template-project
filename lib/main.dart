import 'dart:async';

import 'package:dio_request_inspector/dio_request_inspector.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:project_template/data/base_service/interceptors/request_interceptor.dart';
import 'package:project_template/data/utility/data_dependecies_injection.dart';
import 'package:project_template/domain/module/book/repository/book_repository.dart';
import 'package:project_template/domain/module/book/request/request_book.dart';
import 'package:project_template/presentation/core/config/dart_define_config.dart';
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

      runApp(appWithInspector);
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
  int _counter = 0;
  final BookRepository repository = GetIt.I<BookRepository>();

  void _incrementCounter() async {
    final request = RequestBook();
    final response = await repository.getBooks(request);

    response.fold(
      (error) {
        print(error.message);
      }, 
      (result) {
        print("TESTTTTT $result");
      }
    );
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
