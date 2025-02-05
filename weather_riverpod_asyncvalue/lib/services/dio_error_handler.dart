import 'package:dio/dio.dart';

final class DioErrorHandler {
  DioErrorHandler._();

  String dioErrorHandler(Response response) {
    final statusCode = response.statusCode;
    final statusMessage = response.statusMessage;

    final String errorMessage =
        'Request failed\n\nStatus Code: $statusCode\nReason: $statusMessage';
    return errorMessage;
  }
}
