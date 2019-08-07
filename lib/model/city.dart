// {
//     "id": 668660,
//     "name": "Roseti",
//     "country": "RO",
//     "coord": {
//       "lon": 27.433331,
//       "lat": 44.216671
//     }
//   }

import 'package:weather_app/model/coord.dart';

class City {
  int id;
  String name;
  String country;
  Coord coord;

  City({this.id, this.name, this.country, this.coord});

  City.fromJson(Map<String, dynamic> json) {
    
    id = json['id'];
    name = json['name'];
    country = json['country'];
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    if (this.coord != null) {
      data['coord'] = this.coord.toJson();
    }
    return data;
  }
}
