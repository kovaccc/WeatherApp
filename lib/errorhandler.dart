import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ErrorHandler {
  static Exception resolveNetworkError(
      {required Response<dynamic> response,
      ErrorResolver? customErrorResolver}) {
    final ErrorResolver errorResolver =
        customErrorResolver ?? DefaultErrorResolver();
    return errorResolver.resolve(response);
  }

  static String resolveExceptionMessage(Exception error) {
    if (error is BadRequestError) {
      return "Bad request error";
    } else if (error is ServerError) {
      return "server error ${error.message}";
    } else if (error is NotFoundError) {
      return "weather not found";
    } else {
      return "Unknown error";
    }
  }
}

// error resolvers
abstract class ErrorResolver {
  Exception resolve(Response<dynamic> response);
}

class DefaultErrorResolver implements ErrorResolver {

  @override
  Exception resolve(Response<dynamic> response) {
    final int? statusCode = response.statusCode;
    final String statusMessage = response.statusMessage ?? "";
    if (statusCode != null) {
      if (statusCode >= 500 && statusCode <= 599) {
        return ServerError(statusMessage);
      } else if (statusCode == 400 || statusCode == 423) {
        return const BadRequestError();
      } else if (statusCode == 404) {
        return const NotFoundError("weather is not found");
      }
    }
    return Exception(response.statusMessage);
  }
}

// errors
class ServerError implements Exception {
  final String message;

  const ServerError([this.message = ""]);

  @override
  String toString() => "ServerError: $message";
}

class BadRequestError implements Exception {
  final String message;

  const BadRequestError([this.message = ""]);

  @override
  String toString() => "BadRequestError: $message";
}

class NotFoundError implements Exception {
  final String message;

  const NotFoundError([this.message = ""]);

  @override
  String toString() => "NotFoundError: $message";
}
