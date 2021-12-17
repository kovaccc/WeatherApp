import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathearapp/bloc/weather_bloc.dart';

import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:weathearapp/data/models/persistence/db_weather_response.dart';
import 'package:weathearapp/data/models/responses/weather_response.dart';
import 'package:weathearapp/util/errorhandler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SearchBar searchBar;

  @override
  void initState() {
    buildSearchBar();
    super.initState();
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        title: new Text('Weather App'),
        actions: [searchBar.getSearchAction(context)]);
  }

  buildSearchBar() {
    searchBar = SearchBar(
      inBar: true,
      buildDefaultAppBar: buildAppBar,
      setState: setState,
      hintText: "Enter city",
      onSubmitted: onCitySubmitted,
      onCleared: () {},
      onClosed: () {},
    );
  }

  void onCitySubmitted(String cityName) {
    BlocProvider.of<WeatherBloc>(context).add(WeatherFetch(cityName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      body: Center(
        child: StreamBuilder<List<DBWeatherResponse>>(
          stream: BlocProvider.of<WeatherBloc>(context).weathers,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            print("i am here ${snapshot.data}");
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  DBWeatherResponse weatherResponse = snapshot.data[index];
                  return Text(weatherResponse.name);
                });
          },
        ),
      ),
    );
  }
}

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
                  getWeatherImage(weatherResponse.weather.first.description),
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

  Widget getWeatherImage(String description) {
    final Widget image;
    if (description.contains("clear")) {
      image = Image.asset('assets/icons8_sun_48.png');
    } else if (description.contains("rain")) {
      image = Image.asset('assets/icons8_rain_48.png');
    } else if (description.contains("few clouds")) {
      image = Image.asset('assets/icons8_sun_behind_small_cloud_48.png');
    } else if (description.contains("snow")) {
      image = Image.asset('assets/icons8_snow_48.png');
    } else if (description.contains("cloud")) {
      image = Image.asset('assets/icons8_cloud_48.png');
    } else {
      image = Image.asset('assets/icons8_sun_48.png');
    }
    return image;
  }
}
