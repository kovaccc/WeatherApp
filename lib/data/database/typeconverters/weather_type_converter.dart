import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:weathearapp/data/models/domain/weather.dart';

class WeatherConverter extends TypeConverter<List<Weather>, String> {
  @override
  List<Weather> decode(String databaseValue) {
    List<dynamic> parsedListJson = jsonDecode(databaseValue);
    final result = parsedListJson.map((e) => Weather.fromJson(e)).toList();
    return result;
  }

  @override
  String encode(List<Weather> value) {
    return json.encode(Weather.listToJson(value));
  }
}
