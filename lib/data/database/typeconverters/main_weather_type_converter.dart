import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:weathearapp/data/models/domain/main_weather_data.dart';

class MainWeatherConverter extends TypeConverter<MainWeatherData, String> {
  @override
  MainWeatherData decode(String databaseValue) {
    return MainWeatherData.fromJson(json.decode(databaseValue));
  }

  @override
  String encode(MainWeatherData value) {
    return json.encode(value.toJson());
  }
}
