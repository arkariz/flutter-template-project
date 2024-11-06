import 'package:project_template/data/module/book/model/book_model.dart';
import 'package:project_template/domain/module/book/request/request_book.dart';

abstract class BookRemoteDatasource {
  Future<BooksModel> getBooks(RequestBook request);
}