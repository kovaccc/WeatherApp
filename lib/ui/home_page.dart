import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathearapp/bloc/weather_bloc.dart';
import 'package:weathearapp/data/models/persistence/db_weather_response.dart';
import 'package:weathearapp/util/validator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Weather App')),
      body: Column(
        children: [
          const WeatherForm(),
          SizedBox(width: 200, height: 200,),
          StreamBuilder<List<DBWeatherResponse>>(
            stream: BlocProvider.of<WeatherBloc>(context).weathers,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      DBWeatherResponse weatherResponse = snapshot.data[index];
                      return Text(weatherResponse.name);
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}


class WeatherForm extends StatefulWidget {
  const WeatherForm({Key? key}) : super(key: key);

  @override
  _WeatherFormState createState() => _WeatherFormState();

}

class _WeatherFormState extends State<WeatherForm> {

  final _formKey = GlobalKey<FormState>();
  final cityFieldController = TextEditingController();


  void onCitySubmitted(String cityName) {
    BlocProvider.of<WeatherBloc>(context).add(WeatherFetch(cityName));
  }

  @override
  void dispose() {
    cityFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: cityFieldController,
            validator: (value) {
             return Validator.validate(value, InputType.birthDate);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {

                  onCitySubmitted(cityFieldController.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processing Data ${cityFieldController.text}')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}


