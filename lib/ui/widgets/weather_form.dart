import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/weather_bloc.dart';
import '../../generated/l10n.dart';
import '../../util/validator.dart';

class WeatherForm extends StatefulWidget {
  const WeatherForm({Key? key}) : super(key: key);

  @override
  _WeatherFormState createState() => _WeatherFormState();
}

class _WeatherFormState extends State<WeatherForm> {
  final _formKey = GlobalKey<FormState>();
  final cityFieldController = TextEditingController();

  void onCitySubmitted(String cityName) {
    BlocProvider.of<WeatherBloc>(context).add(WeatherFetchStarted(cityName));
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
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(7.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              label: Text(S.of(context).enter_city),
            ),
            controller: cityFieldController,
            validator: (value) {
              return Validator.validate(value, InputType.required);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        onCitySubmitted(cityFieldController.text);
                      }
                    },
                    child: Text(S.of(context).search),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
