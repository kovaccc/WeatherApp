import 'package:injectable/injectable.dart';
import 'package:weathearapp/common/base/domain_data.dart';
import 'package:weathearapp/data/database/dao/db_weather_response_dao.dart';
import 'package:weathearapp/data/models/persistence/db_weather_response.dart';
import 'package:weathearapp/data/models/responses/weather_response.dart';

@singleton
class WeatherStorage {
  final DBWeatherResponseDao _dao;

  WeatherStorage(this._dao);

  Future<void> saveWeather(WeatherResponse weatherResponse) async {
    await _dao.insert(weatherResponse.asDatabase());
  }

  Future<void> saveWeathers(List<WeatherResponse> weatherResponses) async {
    await _dao.insertMultiple(weatherResponses.asDatabase());
  }

  Future<void> updateWeather(DBWeatherResponse weatherResponse) async {
    await _dao.update(weatherResponse);
  }

  Future<void> deleteWeather(DBWeatherResponse weatherResponse) async {
    await _dao.deleteModel(weatherResponse);
  }

  Stream<List<DBWeatherResponse>> getWeathersStream() {
    return _dao.getWeathersStream();
  }

  Future<List<DBWeatherResponse>> getWeathersAsync() async {
    return await _dao.getWeathersAsync();
  }
}
