import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:weathearapp/data/database/dao/db_weather_response_dao.dart';
import 'package:weathearapp/data/database/typeconverters/main_weather_type_converter.dart';
import 'package:weathearapp/data/database/typeconverters/weather_type_converter.dart';
import 'package:weathearapp/data/database/typeconverters/wind_type_converter.dart';
import 'package:weathearapp/data/models/persistence/db_weather_response.dart';

part 'weather_db.g.dart'; // the generated code will be there

@TypeConverters([WeatherConverter, MainWeatherConverter, WindConverter])
@Database(version: 1, entities: [DBWeatherResponse])
abstract class WeatherDB extends FloorDatabase {
  DBWeatherResponseDao get weatherResponseDao;
}
