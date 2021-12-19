// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/database/dao/db_weather_response_dao.dart' as _i3;
import '../data/database/storage/weather_storage.dart' as _i7;
import '../data/database/weather_db.dart' as _i5;
import '../data/network/rest_client.dart' as _i4;
import '../data/network/service/weather_service.dart' as _i6;
import '../repositories/weather_repository.dart' as _i8;
import 'database_module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final databaseModule = _$DatabaseModule();
  gh.singleton<_i4.RestClient>(_i4.RestClient.create());
  await gh.singletonAsync<_i5.WeatherDB>(() => databaseModule.database,
      preResolve: true);
  gh.singleton<_i3.DBWeatherResponseDao>(databaseModule.weatherResponseDao);
  gh.singleton<_i6.WeatherService>(_i6.WeatherService(get<_i4.RestClient>()));
  gh.singleton<_i7.WeatherStorage>(
      _i7.WeatherStorage(get<_i3.DBWeatherResponseDao>()));
  gh.singleton<_i8.WeatherRepository>(_i8.WeatherRepository(
      get<_i6.WeatherService>(), get<_i7.WeatherStorage>()));
  return get;
}

class _$DatabaseModule extends _i9.DatabaseModule {}
