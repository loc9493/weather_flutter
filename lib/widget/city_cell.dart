import 'package:flutter/material.dart';
import 'package:weather_app/model/city.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view_model/city_model.dart';
import 'package:weather_app/widget/weather_detail_screen.dart';

class CityCell extends StatelessWidget {
  final City city;
  const CityCell(this.city, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Text(city.name),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(color: Colors.amber[200]),
      ),
      onTap: () {
        Provider.of<CityModel>(context).didSelect(city);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WeatherDetailScreen(city)));
      },
    );
  }
}
