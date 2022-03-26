part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherFetchStarted extends WeatherEvent {
  final String cityName;

  const WeatherFetchStarted(this.cityName);

  @override
  List<Object?> get props => [cityName];
}
