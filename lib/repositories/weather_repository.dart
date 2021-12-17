import 'package:weathearapp/data/database/storage/weather_storage.dart';
import 'package:weathearapp/data/models/persistence/db_weather_response.dart';
import 'package:weathearapp/data/models/responses/weather_response.dart';
import 'package:weathearapp/data/network/service/weather_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class WeatherRepository {
  final WeatherService _weatherService;
  final WeatherStorage _weatherStorage;

  WeatherRepository(this._weatherService, this._weatherStorage);

  Future<WeatherResponse> getWeather(String cityName) async {
    final weather = await _weatherService.getWeather(cityName);
    await _weatherStorage.saveWeather(weather);
    return weather;
  }

  Stream<List<DBWeatherResponse>> getWeathersStream() {
    return _weatherStorage.getWeathersStream();
  }

  Future<List<DBWeatherResponse>> getWeathersAsync() async {
    final dbWeatherResponses = await _weatherStorage.getWeathersAsync();
    return dbWeatherResponses;
  }
}
