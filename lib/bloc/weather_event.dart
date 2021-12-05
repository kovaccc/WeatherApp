part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherFetch extends WeatherEvent {
  final String cityName;

  const WeatherFetch(this.cityName);

  @override
  List<Object> get props => [cityName];
}
