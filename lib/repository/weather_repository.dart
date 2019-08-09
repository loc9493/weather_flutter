import 'package:weather_app/model/city.dart';
import 'package:weather_app/model/city_weather.dart';
import 'package:weather_app/repository/weather_api_client.dart';

class WeatherRepository {
  final WeatherApiClient apiClient;
  WeatherRepository(this.apiClient);
  Future<CityWeather> getCityWeather(City city) async {
    var response = await apiClient.getCityWeather(city.id.toString());
    return response;
  }
}