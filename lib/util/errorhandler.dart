import 'package:dio/dio.dart';
import 'package:weathearapp/generated/l10n.dart';

// error handler
class ErrorHandler {
  static Exception resolveNetworkError<T>(
      {required Response<T> response, ErrorResolver? customErrorResolver}) {
    final ErrorResolver errorResolver =
        customErrorResolver ?? DefaultErrorResolver();
    return errorResolver.resolve(response);
  }

  static String resolveExceptionMessage(Exception error) {
    if (error is BadRequestError) {
      return S.current.badRequest;
    } else if (error is ServerError) {
      return S.current.serverError(error.message);
    } else if (error is NotFoundError) {
      return S.current.notFound;
    } else {
      return S.current.unknownError;
    }
  }
}

// error resolvers
abstract class ErrorResolver {
  Exception resolve<T>(Response<T> response);
}

class DefaultErrorResolver implements ErrorResolver {
  @override
  Exception resolve<T>(Response<T> response) {
    final int? statusCode = response.statusCode;
    final String statusMessage = response.statusMessage ?? "";
    if (statusCode != null) {
      if (statusCode >= 500 && statusCode <= 599) {
        return ServerError(statusMessage);
      } else if (statusCode == 400 || statusCode == 423) {
        return const BadRequestError();
      } else if (statusCode == 404) {
        return const NotFoundError();
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

class CancelError implements Exception {
  final String message;

  const CancelError([this.message = ""]);

  @override
  String toString() => "CancelError: $message";
}

class ConnectTimeoutError implements Exception {
  final String message;

  const ConnectTimeoutError([this.message = ""]);

  @override
  String toString() => "ConnectTimeoutError: $message";
}

class SendTimeoutError implements Exception {
  final String message;

  const SendTimeoutError([this.message = ""]);

  @override
  String toString() => "SendTimeoutError: $message";
}

class ReceiveTimeoutError implements Exception {
  final String message;

  const ReceiveTimeoutError([this.message = ""]);

  @override
  String toString() => "ReceiveTimeoutError: $message";
}
