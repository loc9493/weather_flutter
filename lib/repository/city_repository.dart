import 'dart:convert';

import 'package:weather_app/model/city.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:weather_app/model/city_weather.dart';

class CityRepository {
  Future<String> get _localFile async {
    return await rootBundle.loadString('assets/city_list.json');
  }

  Future<List<City>> getCityList() async {
    try {
      final file = await _localFile;
      List data = json.decode(file);
      var result = data.map((item) {
        return City.fromJson(item);
      });
      return result.toList();
    } catch (e) {
      return [];
    }
  }
}
