import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:weathearapp/data/models/responses/weather_response.dart';
import 'package:weathearapp/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherLoading()) {
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
