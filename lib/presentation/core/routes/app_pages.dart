import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project_template/presentation/core/routes/app_routes.dart';
import 'package:project_template/presentation/module/example/example_binding.dart';
import 'package:project_template/presentation/module/example/example_screen.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: AppRoutes.example,
      page: () => ExampleScreen(),
      binding: ExampleBinding(),
    ),
  ];
}
