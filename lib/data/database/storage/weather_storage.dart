import 'package:injectable/injectable.dart';
import 'package:weathearapp/data/database/dao/db_weather_response_dao.dart';
import 'package:weathearapp/data/models/persistence/db_weather_response.dart';
import 'package:weathearapp/data/models/responses/weather_response.dart';

@singleton
class WeatherStorage {
  final DBWeatherResponseDao _dao;

  WeatherStorage(this._dao);

  Future<void> saveWeather(WeatherResponse weatherResponse) async {
    await _dao.insertWeatherResponse(weatherResponse.asDatabase());
  }

  Stream<List<DBWeatherResponse>> getWeathersStream() {
    return _dao.getWeathersStream();
  }

  Future<List<DBWeatherResponse>> getWeathersAsync() async {
    return await _dao.getWeathersAsync();
  }
}
