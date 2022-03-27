import 'package:flutter/material.dart';
import 'package:weathearapp/common/resources/icons.dart';
import 'package:weathearapp/data/models/persistence/db_weather_response.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({Key? key, required this.weatherResponse})
      : super(key: key);
  final DBWeatherResponse weatherResponse;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  weatherResponse.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(
                    getWeatherImageFromDescription(
                        weatherResponse.weather[0].description),
                  ),
                  fit: BoxFit.fitWidth,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 50),
                Text("${weatherResponse.main.temp}K")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(weatherResponse.weather[0].description),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("${weatherResponse.wind.speed}m/s"),
                const SizedBox(width: 20),
                Text("${weatherResponse.main.pressure}hPa"),
                const SizedBox(width: 20),
                Text("Humidity: ${weatherResponse.main.humidity}%"),
              ],
            ),
          ],
        ),
      ),
      elevation: 8,
      shadowColor: Colors.blue,
      margin: const EdgeInsets.all(20),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white)),
    );
  }
}

String getWeatherImageFromDescription(String description) {
  final String imagePath;
  if (description.contains("clear")) {
    imagePath = WeatherIcons.sun;
  } else if (description.contains("rain")) {
    imagePath = WeatherIcons.rain;
  } else if (description.contains("few clouds")) {
    imagePath = WeatherIcons.sunBehindCloud;
  } else if (description.contains("snow")) {
    imagePath = WeatherIcons.snow;
  } else if (description.contains("cloud")) {
    imagePath = WeatherIcons.cloud;
  } else {
    imagePath = WeatherIcons.sun;
  }
  return imagePath;
}
