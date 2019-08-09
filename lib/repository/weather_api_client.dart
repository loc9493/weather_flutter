import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/city_weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static final String baseURL = "https://api.openweathermap.org/";
  final http.Client httpClient;
  final APP_TOKEN = "2b99151af6edd2eac0b2eceebeddd35e";
  WeatherApiClient({@required this.httpClient}) : assert(httpClient != null);
  Future<CityWeather> getCityWeather(String cityID) async {
    final url = baseURL + "/data/2.5/weather?id=$cityID&APPID=$APP_TOKEN";
    var response = await httpClient.get(url);
    if (response.statusCode == 200) {
      return CityWeather.fromJson(jsonDecode(response.body));
    }
    return CityWeather();
  }
}
