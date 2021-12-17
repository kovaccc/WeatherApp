import 'package:floor/floor.dart';
import 'package:weathearapp/data/models/persistence/db_weather_response.dart';

@dao
abstract class DBWeatherResponseDao {
  @Query('SELECT * FROM DBWeatherResponse')
  Future<List<DBWeatherResponse>> getWeathersAsync();

  @Query('SELECT * FROM DBWeatherResponse WHERE id = :id')
  Stream<DBWeatherResponse?> getWeatherStreamById(int id);

  @Query('SELECT * FROM DBWeatherResponse')
  Stream<List<DBWeatherResponse>> getWeathersStream();

  @insert
  Future<void> insertWeatherResponse(DBWeatherResponse dbWeatherResponse);
}
