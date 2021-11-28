

import 'package:weathearapp/data/models/responses/weather_response.dart';
import 'package:weathearapp/data/network/service/weather_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class WeatherRepository {
  final WeatherService _weatherService;

  WeatherRepository(this._weatherService);

  Future<WeatherResponse> getWeather(String cityName) async {
    final weather = await _weatherService.getWeather(cityName);
    //TODO add it to local database
    return weather;
  }
}