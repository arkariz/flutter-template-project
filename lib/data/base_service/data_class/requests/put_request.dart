// ignore_for_file: non_constant_identifier_names, always_specify_types
part of 'base_request.dart';

Future<dynamic> PutRequest(
  Dio? dio, {
  required String url,
  required JSON headers,
  required JSON data,
}) async {
  final response = await dio!.put(
    url,
    data: jsonEncode(data),
    options: Options(headers: headers),
  );

  return response.data;
}
