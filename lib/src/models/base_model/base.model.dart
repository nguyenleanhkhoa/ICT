class BaseResponseModel<T> {
  BaseResponseModel({
    this.statusCode,
    this.message,
    this.result,
  });

  BaseResponseModel copyWith({
    int? statusCode,
    String? message,
    List<dynamic>? result,
  }) =>
      BaseResponseModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  int? statusCode;
  String? message;
  T? result;
}
