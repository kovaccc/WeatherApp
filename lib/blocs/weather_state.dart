part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherResponse weatherResponse;

  const WeatherLoaded(this.weatherResponse);

  @override
  List<Object> get props => [weatherResponse];
}

class WeatherError extends WeatherState {
  final Exception error;

  const WeatherError(this.error);

  @override
  List<Object> get props => [error];
}
