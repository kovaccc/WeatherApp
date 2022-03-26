import 'package:dio/dio.dart';
import 'package:weathearapp/util/errorhandler.dart';

class BaseService {
  Future<T> apiRequest<T>(
      {required apiCall, ErrorResolver? errorResolver}) async {
    try {
      return await apiCall;
    } catch (error) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              throw CancelError(error.message);
            case DioErrorType.connectTimeout:
              throw ConnectTimeoutError(error.message);
            case DioErrorType.sendTimeout:
              throw SendTimeoutError(error.message);
            case DioErrorType.receiveTimeout:
              throw ReceiveTimeoutError(error.message);
            case DioErrorType.other:
              throw Exception(error.message);
            case DioErrorType.response:
              throw ErrorHandler.resolveNetworkError(
                  response: error.response!,
                  customErrorResolver: errorResolver);
            default:
              throw Exception(error.message);
          }
        }
      } catch (e) {
        rethrow;
      }
      throw Exception(error.toString());
    }
  }
}
