import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weathearapp/data/models/responses/weather_response.dart';
import 'package:dio/dio.dart';
import 'package:weathearapp/config/constants.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';

part 'rest_client.g.dart';

@singleton
@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @factoryMethod
  static RestClient create() {
    final Dio dio = Dio(BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: 30000, //30s
        receiveTimeout: 30000,
        sendTimeout: 30000));
    dio.interceptors
        .add(DioLoggingInterceptor(level: Level.body, compact: false));
    return RestClient(dio);
  }

  @GET("/data/2.5/weather")
  Future<WeatherResponse> getWeather(@Query("q") String cityName,
      [@Query("appid") String apiKey = Constants.weatherApiKey]);
}
