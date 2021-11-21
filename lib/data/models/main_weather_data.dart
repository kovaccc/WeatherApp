import 'package:json_annotation/json_annotation.dart';

part 'main_weather_data.g.dart';

@JsonSerializable()
class MainWeatherData {
  final double temp;
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int humidity;

  MainWeatherData({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
  });

  factory MainWeatherData.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$MainWeatherDataToJson(this);
}
