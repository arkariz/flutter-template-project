import 'package:dio/dio.dart';
import 'package:project_template/data/base_service/utils/logger.dart';

class LoggingInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    LoggerUtil.getLogger('').i('==================== ${options.path} ====================');
    LoggerUtil.getLogger('REQUEST[${options.method}] => ').i('${options.headers} ${options.path}');
    LoggerUtil.getLogger('REQUEST[${options.method}] BODY => ').i('${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.responseType == ResponseType.bytes) {
      return super.onResponse(response, handler);
    }
    
    LoggerUtil.getLogger('RESPONSE[${response.statusCode}] => ').i('${response.data}');
    LoggerUtil.getLogger('').i('==================== ${response.requestOptions.path} ====================');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    LoggerUtil.getLogger('RESPONSE[${err.response?.statusCode}] => ').e('${err.requestOptions.path} ----  ${err.response?.data}');
    LoggerUtil.getLogger('').i('==================== ${err.requestOptions.path} ====================');
    return super.onError(err, handler);
  }
}
