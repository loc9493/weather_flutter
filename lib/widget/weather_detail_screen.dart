import 'package:flutter/material.dart';
import 'package:weather_app/model/city.dart';
import 'package:weather_app/model/city_weather.dart';
import 'package:weather_app/repository/weather_api_client.dart';
import 'package:weather_app/repository/weather_repository.dart';
import 'package:http/http.dart' as http;

class WeatherDetailScreen extends StatefulWidget {
  final City _city;
  const WeatherDetailScreen(this._city, {Key key}) : super(key: key);

  @override
  _WeatherDetailScreenState createState() =>
      _WeatherDetailScreenState(city: _city);
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  WeatherRepository repo;
  final City city;
  CityWeather _cityWeather;
  _WeatherDetailScreenState({Key key, @required this.city});
  @override
  void initState() {
    repo = WeatherRepository(WeatherApiClient(httpClient: http.Client()));
    getCityWeather();
    super.initState();
  }

  void getCityWeather() async {
    _cityWeather = await repo.getCityWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Builder(builder: (context) {
          if (_cityWeather != null) {
            return Text(_cityWeather.toRawJson());
          }
          return Text(city.name);
        },),
      ),
    );
  }
}
