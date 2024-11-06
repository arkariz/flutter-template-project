import 'dart:io';
import 'package:dio/dio.dart';
import 'package:project_template/data/exception/custome_exception.dart';
import 'typedefs.dart';
import 'extensions.dart';

abstract class ErrorHandler {

  static void call(DioException error) {
    _handlers(error);
  }

  static void _handlers(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionError:
        throw NoInternetException(exception: error.error ?? error, message: error.message ?? "No internet connection", stackTrace: error.stackTrace);
      case DioExceptionType.connectionTimeout:
        throw RequestTimeoutException(exception: error.error ?? error, message: error.message ?? "Request Timeout", stackTrace: error.stackTrace);
      case DioExceptionType.sendTimeout:
        throw RequestTimeoutException(exception: error.error ?? error, message: error.message ?? "Request Timeout", stackTrace: error.stackTrace);
      case DioExceptionType.receiveTimeout:
        throw RequestTimeoutException(exception: error.error ?? error, message: error.message ?? "Request Timeout", stackTrace: error.stackTrace);
      case DioExceptionType.badResponse:
        _handleBadResponse(error);
        break;
      case DioExceptionType.unknown:
        _handleBadResponse(error);
        break;
      default:
    }
  }

  static void _handleBadResponse(DioException e) {
    final int statusCode = e.response?.statusCode ?? -1;
    final data = e.response;

    if (data == null) {
      throw DecodeFailedException(message: "No response data received");
    }

    final ErrorMap errorMap = {
      HttpStatus.badRequest: data.errorMessage,
      HttpStatus.unauthorized: data.errorMessage,
      HttpStatus.forbidden: data.errorMessage,
      HttpStatus.notFound: data.errorMessage,
      HttpStatus.requestTimeout: data.errorMessage,
      HttpStatus.tooManyRequests: data.errorMessage,
      HttpStatus.internalServerError: data.errorMessage,
      HttpStatus.serviceUnavailable: data.errorMessage,
      HttpStatus.badGateway: data.errorMessage,
      HttpStatus.networkConnectTimeoutError: data.errorMessage,
      HttpStatus.httpVersionNotSupported: data.errorMessage,
    };

    throw BadResponseException(message: errorMap[statusCode], exception: e.error, stackTrace: e.stackTrace);
  }
}
