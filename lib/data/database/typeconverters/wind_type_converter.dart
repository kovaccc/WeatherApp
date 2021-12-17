import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:weathearapp/data/models/domain/wind.dart';

class WindConverter extends TypeConverter<Wind, String> {
  @override
  Wind decode(String databaseValue) {
    return Wind.fromJson(json.decode(databaseValue));
  }

  @override
  String encode(Wind value) {
    return json.encode(value.toJson());
  }
}
