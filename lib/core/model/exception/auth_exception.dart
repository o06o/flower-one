import 'package:flowerone/core/model/exception/exception.dart';

class AuthException extends FlowerException {
  AuthException({
    super.httpStatusCode,
    String super.message = "Authentication Error",
  });
}