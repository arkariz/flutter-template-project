import 'dart:async';

import 'package:dio_request_inspector/dio_request_inspector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:project_template/data/base_service/interceptors/request_interceptor.dart';
import 'package:project_template/data/utility/data_dependecies_injection.dart';
import 'package:project_template/presentation/core/config/dart_define_config.dart';
import 'package:project_template/presentation/core/generated/i18n/translations.g.dart';
import 'package:project_template/presentation/core/routes/app_pages.dart';
import 'package:project_template/presentation/core/routes/app_routes.dart';
import 'package:project_template/presentation/core/widgets/fl_responsive/fl_responsive.dart';
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      getPages: AppPages.routes,
      initialRoute: AppRoutes.example,
      builder: (context, child) {
        return FLResponsive(
          builder: (context, orientation, screenType) {
            return child!;
          }
        );
      }
    );
  }
}
