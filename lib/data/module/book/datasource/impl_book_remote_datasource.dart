import 'package:project_template/data/module/book/datasource/book_remote_datasource.dart';
import 'package:project_template/data/module/book/model/book_model.dart';
import 'package:project_template/data/utility/handler/datasource_handler.dart';
import 'package:project_template/data/utility/service_manager/name_manager.dart';
import 'package:project_template/data/utility/service_manager/name_service_config.dart';
import 'package:project_template/domain/module/book/request/request_book.dart';

class ImplBookRemoteDatasource extends DatasourceHandler implements BookRemoteDatasource {  
  ImplBookRemoteDatasource({required this.manager, required this.config});
  
  final NameManager manager;
  final NameServiceConfig config;

  @override
  Future<BooksModel> getBooks(RequestBook request) async{
    return handleDecode(() async {
      final response = await manager.get(
        endpoint: _EndPoint.books,
        data: request.toJson(),
        additionalHeaders: config.tokenHeader,
      );

      return BooksModel.fromJson(response);
    });
  }
}

class _EndPoint {
  static String books = "en/books";
}
