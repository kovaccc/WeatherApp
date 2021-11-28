// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/network/rest_client.dart' as _i3;
import '../data/network/service/weather_service.dart' as _i4;
import '../repositories/weather_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.RestClient>(_i3.RestClient.create());
  gh.singleton<_i4.WeatherService>(_i4.WeatherService(get<_i3.RestClient>()));
  gh.singleton<_i5.WeatherRepository>(
      _i5.WeatherRepository(get<_i4.WeatherService>()));
  return get;
}
