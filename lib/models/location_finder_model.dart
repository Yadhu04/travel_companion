// To parse this JSON data, do
//
//     final locationFinder = locationFinderFromJson(jsonString);

import 'dart:convert';

LocationFinder locationFinderFromJson(String str) =>
    LocationFinder.fromJson(json.decode(str));

String locationFinderToJson(LocationFinder data) => json.encode(data.toJson());

class LocationFinder {
  String name;
  String country;
  double lat;
  double lon;
  int population;
  String timezone;
  String status;

  LocationFinder({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
    required this.population,
    required this.timezone,
    required this.status,
  });

  factory LocationFinder.fromJson(Map<String, dynamic> json) => LocationFinder(
        name: json["name"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        population: json["population"],
        timezone: json["timezone"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "country": country,
        "lat": lat,
        "lon": lon,
        "population": population,
        "timezone": timezone,
        "status": status,
      };
}
