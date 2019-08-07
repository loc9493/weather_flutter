import 'dart:io';

import 'package:flutter/cupertino.dart';

class WeatherApiClient {
  static final String baseURL = "https://api.openweathermap.org/";
  final HttpClient httpClient;
  WeatherApiClient({@required this.httpClient}) : assert(httpClient != null);
}
