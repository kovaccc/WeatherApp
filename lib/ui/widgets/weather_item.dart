import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathearapp/bloc/weather_bloc.dart';
import 'package:weathearapp/util/errorhandler.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return const CircularProgressIndicator();
        }
        if (state is WeatherFetched) {
          final weatherResponse = state.weatherResponse;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${weatherResponse.main.temp}"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      "Feels like ${weatherResponse.main.feels_like.toInt()}F."),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    Text("${weatherResponse.weather.first.description}."),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${weatherResponse.main.pressure}hPa"),
                  Text("Humidity: ${weatherResponse.main.humidity}%"),
                ],
              ),
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Visibility: ${weatherResponse.visibility / 1000}km",
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ],
          );
        }
        if (state is WeatherError) {
          return Text(ErrorHandler.resolveExceptionMessage(state.error));
        }
        return const Text('Something went wrong!');
      }),
      elevation: 8,
      shadowColor: Colors.blue,
      margin: const EdgeInsets.all(20),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white)),
    );
  }

  String getWeatherImageResource(String description) {
    final String image;
    if (description.contains("clear")) {
      image = 'assets/icons8_sun_48.png';
    } else if (description.contains("rain")) {
      image = 'assets/icons8_rain_48.png';
    } else if (description.contains("few clouds")) {
      image = 'assets/icons8_sun_behind_small_cloud_48.png';
    } else if (description.contains("snow")) {
      image = 'assets/icons8_snow_48.png';
    } else if (description.contains("cloud")) {
      image = 'assets/icons8_cloud_48.png';
    } else {
      image = 'assets/icons8_sun_48.png';
    }
    return image;
  }
}