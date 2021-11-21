// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../config/constants.dart' as _i3;
import '../data/network/rest_client.dart' as _i5;
import '../data/network/service/weather_service.dart' as _i6;
import '../errorhandler.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.Constants>(_i3.Constants());
  gh.singleton<_i4.ErrorHandler>(_i4.ErrorHandler());
  gh.singleton<_i5.RestClient>(_i5.RestClient.create());
  gh.singleton<_i6.WeatherService>(_i6.WeatherService(get<_i5.RestClient>()));
  return get;
}
