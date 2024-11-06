import 'package:dartz/dartz.dart';
import 'package:project_template/domain/failure/custome_failure.dart';
import 'package:project_template/domain/module/book/entity/book.dart';
import 'package:project_template/domain/module/book/request/request_book.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>>> getBooks(RequestBook request);
}
