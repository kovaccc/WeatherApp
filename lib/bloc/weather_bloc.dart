import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:weathearapp/data/models/persistence/db_weather_response.dart';
import 'package:weathearapp/data/models/responses/weather_response.dart';
import 'package:weathearapp/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  Stream<List<DBWeatherResponse>> get weathers {
    return weatherRepository.getWeathersStream();
  }

  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<WeatherFetch>(_onWeatherFetch);
  }

  void _onWeatherFetch(WeatherFetch event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weatherResponse =
          await weatherRepository.getWeather(event.cityName);
      emit(WeatherFetched(weatherResponse));
    } catch (e) {
      if (e is Exception) {
        emit(WeatherError(e));
      }
    }
  }
}

//TODO add freezed classes
//TODO make widgets (don't make functions make class widgets)
//TODO remove search bar add form field and make validator
//TODO base dao class
//TODO interface for weather from and to json