import 'package:floor/floor.dart';
import 'package:weathearapp/common/base/base_dao.dart';
import 'package:weathearapp/config/constants.dart';
import 'package:weathearapp/data/models/persistence/db_weather_response.dart';

@dao
abstract class DBWeatherResponseDao extends BaseDao<DBWeatherResponse> {
  @Query('SELECT * FROM ${Constants.tableWeatherResponse}')
  Future<List<DBWeatherResponse>> getWeathersAsync();

  @Query('SELECT * FROM ${Constants.tableWeatherResponse} WHERE id = :id')
  Stream<DBWeatherResponse?> getWeatherStreamById(int id);

  @Query('SELECT * FROM ${Constants.tableWeatherResponse}')
  Stream<List<DBWeatherResponse>> getWeathersStream();
}
