import 'package:get/get.dart';
import 'package:project_template/domain/module/book/entity/book.dart';
import 'package:project_template/domain/module/book/repository/book_repository.dart';
import 'package:project_template/domain/module/book/request/request_book.dart';

class ExampleController extends GetxController {
  ExampleController({
    required this.bookRepository
  });

  final BookRepository bookRepository;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  final _books = <Book>[].obs;
  RxList<Book> get books => _books;

  Future<void> fetchBooks() async {
    final request = RequestBook(
      page: 1,
    );
    final response = await bookRepository.getBooks(request); 

    response.fold(
      (error) {

      }, 
      (result) {
        _books.addAll(result);
      },
    );
  }
}