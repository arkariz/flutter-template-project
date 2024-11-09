import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:project_template/domain/module/book/repository/book_repository.dart';
import 'package:project_template/presentation/module/example/example_controller.dart';

class ExampleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController(
      bookRepository: GetIt.I<BookRepository>(),
    ));
  }
}