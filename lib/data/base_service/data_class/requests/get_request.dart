// ignore_for_file: non_constant_identifier_names, always_specify_types
part of 'base_request.dart';

Future<dynamic> GetRequest(
  Dio? dio, {
  required String url,
  required JSON headers,
  JSON? data,
  required bool isReturnJson,
}) async {
  String getUrl = url;

  if (data != null && data.isNotEmpty) {
    final convertedData = data.map((key, value) => MapEntry(key, value.toString()));
    final queryString = Uri(queryParameters: convertedData).query;
    getUrl += '?$queryString';
  }

  final response = await dio!.get(
    getUrl,
    options: Options(
        headers: headers,
        responseType: isReturnJson ? ResponseType.json : ResponseType.bytes),
  );

  return response.data;
}
