// ignore_for_file: non_constant_identifier_names, always_specify_types
part of 'base_request.dart';

Future<dynamic> DeleteRequest(
  Dio? dio, {
  required String url,
  required JSON headers,
  JSON? data,
}) async {
  String getUrl = url;

  if (data != null) {
    final queryString = Uri(queryParameters: data).query;
    getUrl += '?$queryString';
  }

  final response = await dio!.delete(
    getUrl,
    options: Options(headers: headers),
  );

  return response.data;
}
