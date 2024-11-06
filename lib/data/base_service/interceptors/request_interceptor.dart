import 'package:dio_request_inspector/dio_request_inspector.dart';

late DioRequestInspector dioRequestInspector;

void setRequestInspector({required DioRequestInspector requestInspector}) {
  dioRequestInspector = requestInspector;
}
