import 'package:json_annotation/json_annotation.dart';
import 'package:weathearapp/data/models/domain/main_weather_data.dart';
import 'package:weathearapp/data/models/domain/weather.dart';
import 'package:weathearapp/data/models/domain/wind.dart';

part 'weather_response.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherResponse {
  final List<Weather> weather;
  final MainWeatherData main;
  final Wind wind;
  final int visibility;
  final String name;

  WeatherResponse(
      {required this.weather,
      required this.name,
      required this.main,
      required this.wind,
      required this.visibility});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
