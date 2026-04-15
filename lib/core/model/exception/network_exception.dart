import 'flower_exception.dart';

class NetworkException extends FlowerException {
  NetworkException({
    super.httpStatusCode,
    String super.message = "Network Error",
  });
}