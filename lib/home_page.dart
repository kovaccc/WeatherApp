import 'package:flutter/material.dart';
import 'package:weathearapp/data/models/responses/weather_response.dart';
import 'package:weathearapp/data/network/service/weather_service.dart';
import 'package:weathearapp/di/injection.dart';
import 'package:weathearapp/errorhandler.dart';
import 'package:weathearapp/generated/l10n.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final service = getIt.get<WeatherService>();
  WeatherResponse? _weatherResponse = null;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void printWeather() async {
    try{
      final response = await service.getWeather("dasdasvfa");
      setState(() {
        _weatherResponse = response;
      });
    } catch(e) {
      print("${ErrorHandler.resolveExceptionMessage(e as Exception)}");
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times: ${_weatherResponse?.name.toString()}',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => printWeather(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
