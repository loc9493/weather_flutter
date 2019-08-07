import 'package:flutter/foundation.dart';
import 'package:weather_app/model/city.dart';
import 'package:weather_app/repository/city_repository.dart';

class CityModel extends ChangeNotifier {
  final CityRepository cityRepository = CityRepository();
  List<City> listCity = [];
  City city;
  void textDidChange(String text) {
    print(text);
    if (listCity.isNotEmpty) {
      var data = [];
      for (var item in listCity) {
        if (item.name.toLowerCase().contains(text.toLowerCase())) {
          data.add(item);
        }
      }
      print("test:" + data.length.toString());
      print("test:" + data[0].name.toString());
      city = data[0];
    }
    notifyListeners();
  }

  void didSelectTextField() async {
    if (listCity.isEmpty) {
      listCity = await cityRepository.getCityList();
    }
  }
}