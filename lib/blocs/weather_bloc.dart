import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:weathearapp/data/models/persistence/db_weather_response.dart';
import 'package:weathearapp/data/models/responses/weather_response.dart';
import 'package:weathearapp/repositories/weather_repository.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<WeatherFetchStarted>(_onWeatherFetchStarted);
  }

  Stream<List<DBWeatherResponse>> get weathers {
    return weatherRepository.getWeathersStream();
  }

  void _onWeatherFetchStarted(
      WeatherFetchStarted event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weatherResponse =
          await weatherRepository.getWeather(event.cityName);
      emit(WeatherLoaded(weatherResponse));
    } catch (error) {
      if (error is Exception) {
        emit(WeatherError(error));
      }
    }
  }
}
