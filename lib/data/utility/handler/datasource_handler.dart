import 'package:project_template/data/exception/custome_exception.dart';

class DatasourceHandler {
  T handleDecode<T>(T Function() operation) {
    try {
      return operation();
    } catch (e, s) {
      throw DecodeFailedException(message: e.toString(), exception: e, stackTrace: s);
    }
  }
}