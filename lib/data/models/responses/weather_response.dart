import 'package:json_annotation/json_annotation.dart';
import 'package:weathearapp/data/models/main_weather_data.dart';
import 'package:weathearapp/data/models/weather.dart';

part 'weather_response.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherResponse {
  final List<Weather> weather;
  final MainWeatherData main;
  final String name;

  WeatherResponse(
      {required this.weather, required this.name, required this.main});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
