import 'package:injectable/injectable.dart';
import 'package:weathearapp/config/constants.dart';
import 'package:weathearapp/data/database/dao/db_weather_response_dao.dart';
import 'package:weathearapp/data/database/weather_db.dart';
import 'package:weathearapp/di/injection.dart';

@module
abstract class DatabaseModule {
  @preResolve
  @singleton
  Future<WeatherDB> get database =>
      $FloorWeatherDB.databaseBuilder(Constants.dbName).build();

  @singleton
  DBWeatherResponseDao get weatherResponseDao =>
      getIt<WeatherDB>().weatherResponseDao;
}
