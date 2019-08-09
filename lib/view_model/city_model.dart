import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/model/city.dart';
import 'package:weather_app/repository/city_repository.dart';

class CityModel extends ChangeNotifier {
  final CityRepository cityRepository = CityRepository();
  List<City> _listCity = [];
  List<City> _result = [];
  City city;

  CityModel({Key key}) {
    getCityList();
  }

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<City> get items => UnmodifiableListView(_result);

  void getCityList() async {
    _listCity = await cityRepository.getCityList();
    _result.addAll(_listCity);
    notifyListeners();
    print(_listCity.length);
  }

  void textDidChange(String text) {
    print(text);
    if (_listCity.isNotEmpty) {
      _result.clear();
      for (var item in _listCity) {
        if (item.name.toLowerCase().contains(text.toLowerCase())) {
          _result.add(item);
        }
      }
      print(_result.length);
    }
    notifyListeners();
  }

  void didSelectTextField() async {}

  void didSelect(City city) {
    this.city = city;
    print(city.name);
  }
  void didSearchForCity() {}
}
