class Coord {
  double lon;
  double lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    var lon1 = json['lon'];
    var lat1 = json['lat'];
    if (lon1 is int) {
      lon = double.parse(lon1.toString());
    }
    if (lat1 is int) {
      lat = double.parse(lat1.toString());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}
