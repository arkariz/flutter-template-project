import 'package:dio/dio.dart';
import 'package:project_template/data/base_service/base_service.dart';
import 'package:project_template/data/utility/service_manager/name_service_config.dart';

class NameManager extends BaseService {
  static NameManager? _instance;
  final NameServiceConfig serviceConfig = NameServiceConfig();

  factory NameManager() {
    _instance ??= NameManager._internal();
    return _instance!;
  }

  NameManager._internal() : super(additionalInterceptor: _buildAdditionalInterceptors());

  static List<Interceptor> _buildAdditionalInterceptors() {
    final interceptors = <Interceptor>[];
    // interceptors.add(interceptor);
    return interceptors;
  }

  @override
  String get baseUrl => serviceConfig.getBaseUrl;
}
