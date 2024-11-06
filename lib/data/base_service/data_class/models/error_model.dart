class ErrorResponse {
  ErrorResponse({
    this.code,
    this.message,
    this.errors,
  });

  int? code;
  String? message;
  dynamic errors;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json["code"],
      message: json["message"],
      errors: json["errors"],
    );
  }
}

class Error {
  Error({
    this.field,
    this.code,
    this.message,
  });

  String? field;
  String? code;
  String? message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    field: json["field"],
    code: json["code"],
    message: json["message"],
  );
}
