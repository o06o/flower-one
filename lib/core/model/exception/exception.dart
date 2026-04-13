class FlowerException implements Exception {
  final int? httpStatusCode;
  final String? message;

  FlowerException({
    this.httpStatusCode,
    this.message = "An error occurred",
  });

  @override
  String toString() {
    return "$message $httpStatusCode";
  }
}

class NetworkException extends FlowerException {
  NetworkException({
    super.httpStatusCode,
    String super.message = "Network Error",
  });
}

class AuthException extends FlowerException {
  AuthException({
    super.httpStatusCode,
    String super.message = "Authentication Error",
  });
}


