import 'dart:io';

import 'package:project_template/data/utility/service_manager/name_flavor.dart';

class NameServiceConfig {
  static final NameServiceConfig _instance = NameServiceConfig._internal();
  factory NameServiceConfig() => _instance;
  NameServiceConfig._internal();

  String get getBaseUrl => nameFlavorValue.baseUrl;
  String get _nameApiKey => nameFlavorValue.apikey;

  String _accessToken = "";
  Map<String, String> get tokenHeader => {
    "apikey": _nameApiKey,
    HttpHeaders.authorizationHeader: "Bearer $_accessToken",
  };

  void updateAccessToken(String token) {
    _accessToken = token;
  }
}