import 'package:dio/dio.dart';
// import '../data/models/error_model.dart';

extension ErrorResponseExtension on Response<dynamic> {

  String get errorMessage {
    // TODO: implement errorMessage
    return 'errorMessage';
    // final errorResponse = ErrorResponse.fromJson(data);

    // if (errorResponse.errors is List) {
    //   return errorResponse.errors.first.message.toString().capitalizeFirst;
    // } else if (errorResponse.errors.runtimeType == Error) {
    //   return errorResponse.errors.message.toString().capitalizeFirst;
    // } else {
    //   return errorResponse.errors.toString().capitalizeFirst;
    // }
  }
}

extension StringExtension on String {
  String get capitalizeFirst {
    if (isEmpty) {
      return this;
    } else {
      return "${this[0].toUpperCase()}${substring(1)}";
    }
  }
}

extension MergeMapExtension<K, V> on Map<K, V> {
  Map<K, V> merge(Map<K, V>? map) {
    return {...this, ...?map};
  }
}
