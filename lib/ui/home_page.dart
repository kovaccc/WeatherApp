import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathearapp/bloc/weather_bloc.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

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
      inBar: false,
      buildDefaultAppBar: buildAppBar,
      setState: setState,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
