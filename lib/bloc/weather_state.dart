part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {}

class WeatherFetched extends WeatherState {
  final WeatherResponse weatherResponse;

  const WeatherFetched(this.weatherResponse);

  @override
  List<Object> get props => [weatherResponse];
}

class WeatherError extends WeatherState {
  final Exception error;

  const WeatherError(this.error);

  @override
  List<Object> get props => [error];
}
