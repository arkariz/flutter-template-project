import 'package:dartz/dartz.dart';
import 'package:project_template/data/module/book/datasource/book_remote_datasource.dart';
import 'package:project_template/data/utility/handler/repository_handler.dart';
import 'package:project_template/domain/failure/custome_failure.dart';
import 'package:project_template/domain/module/book/entity/book.dart';
import 'package:project_template/domain/module/book/repository/book_repository.dart';
import 'package:project_template/domain/module/book/request/request_book.dart';

class ImplBookRepository extends RepositoryHandler implements BookRepository {
  ImplBookRepository(this._remoteDataSource);
  
  final BookRemoteDatasource _remoteDataSource;

  @override
  Future<Either<Failure, List<Book>>> getBooks(RequestBook request) async {
    return handleOperation(() async {
      final response = await _remoteDataSource.getBooks(request);
      return response.toEntity();
    });
  }
}
