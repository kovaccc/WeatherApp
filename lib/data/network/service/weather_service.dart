import 'dart:math';

import 'package:weathearapp/data/models/responses/weather_response.dart';
import 'package:weathearapp/data/network/rest_client.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:weathearapp/errorhandler.dart';
import 'package:weathearapp/di/injection.dart';



class BaseService {
  Future<T> apiRequest<T>({required apiCall}) async {
    try {
      return await apiCall;
    } catch (error) {
      if (error is Exception) {
        try {
          if (error is DioError) {
            switch (error.type) {
              case DioErrorType.cancel:
                throw Exception();
              case DioErrorType.connectTimeout:
                throw Exception();
              case DioErrorType.sendTimeout:
                throw Exception();
              case DioErrorType.receiveTimeout:
                throw Exception();
              case DioErrorType.other:
                throw Exception();
              case DioErrorType.response:
                throw ErrorHandler.resolveNetworkError(
                    response: error.response!);
              default:
                throw Exception();
            }
          }
        } catch (e) {
          rethrow;
        }
      }
      throw Exception();
    }
  }
}

@singleton
class WeatherService extends BaseService {
  final RestClient _restClient;

  WeatherService(this._restClient);

  Future<WeatherResponse> getWeather(String cityName) async {
    return await apiRequest(apiCall: _restClient.getWeather(cityName));
  }
}
