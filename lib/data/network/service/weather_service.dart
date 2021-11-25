import 'package:weathearapp/common/base/base_service.dart';
import 'package:weathearapp/data/models/responses/weather_response.dart';
import 'package:weathearapp/data/network/rest_client.dart';
import 'package:injectable/injectable.dart';

@singleton
class WeatherService extends BaseService {
  final RestClient _restClient;

  WeatherService(this._restClient);

  Future<WeatherResponse> getWeather(String cityName) async {
    return await apiRequest(apiCall: _restClient.getWeather(cityName));
  }
}
