import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathearapp/blocs/weather_bloc.dart';
import 'package:weathearapp/data/models/persistence/db_weather_response.dart';
import 'package:weathearapp/generated/l10n.dart';
import 'package:weathearapp/ui/widgets/error_dialog.dart';
import 'package:weathearapp/ui/widgets/loading_overlay.dart';
import 'package:weathearapp/ui/widgets/weather_form.dart';
import 'package:weathearapp/ui/widgets/weather_item.dart';

import '../util/errorhandler.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listenWhen: (previousState, state) {
        return previousState is WeatherLoading || state is WeatherLoading;
      },
      listener: (context, state) {
        if (state is WeatherLoading) {
          _loadingOverlay.show(context);
        } else {
          _loadingOverlay.hide();
          if (state is WeatherError) {
            showErrorDialog(
              context,
              S.of(context).error,
              ErrorHandler.resolveExceptionMessage(state.error),
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(S.of(context).weather_app)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const WeatherForm(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              StreamBuilder<List<DBWeatherResponse>>(
                stream: BlocProvider.of<WeatherBloc>(context).weathers,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text(S.of(context).no_data));
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        DBWeatherResponse weatherResponse =
                            snapshot.data[index];
                        return WeatherItem(weatherResponse: weatherResponse);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
