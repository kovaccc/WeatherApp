import 'package:floor/floor.dart';
import 'package:weathearapp/common/base/persistable.dart';
import 'package:weathearapp/data/models/domain/main_weather_data.dart';
import 'package:weathearapp/data/models/domain/weather.dart';
import 'package:weathearapp/data/models/domain/wind.dart';
import 'package:weathearapp/data/models/responses/weather_response.dart';

@entity
class DBWeatherResponse implements Persistable<WeatherResponse> {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final List<Weather> weather;
  final MainWeatherData main;
  final Wind wind;
  final int visibility;
  final String name;

  DBWeatherResponse(
      {this.id,
      required this.weather,
      required this.name,
      required this.main,
      required this.wind,
      required this.visibility});

  @override
  WeatherResponse asDomain() {
    return WeatherResponse(
        weather: weather,
        name: name,
        main: main,
        wind: wind,
        visibility: visibility);
  }
}
