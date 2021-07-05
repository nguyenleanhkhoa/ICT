class ExceptionHandler implements Exception {
  const ExceptionHandler([this._message, this._prefix, this._statusCode]);

  final String? _message;
  final String? _prefix;
  final int? _statusCode;
}

class FetchDataException extends ExceptionHandler {
  FetchDataException(String message, int statusCode)
      : super(message, 'Error During Communication: ', statusCode);
}

class BadRequestException extends ExceptionHandler {
  BadRequestException(String message, int statusCode)
      : super(message, 'Invalid Request: ', statusCode);
}

class UnauthorisedException extends ExceptionHandler {
  UnauthorisedException(String message, int statusCode)
      : super(message, 'Unauthorised: ', statusCode);
}

class InvalidInputException extends ExceptionHandler {
  InvalidInputException(String message, int statusCode)
      : super(message, 'Invalid Input: ', statusCode);
}
