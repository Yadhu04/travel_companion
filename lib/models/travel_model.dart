// To parse this JSON data, do
//
//     final travelModel = travelModelFromJson(jsonString);

import 'dart:convert';

TravelModel travelModelFromJson(String str) =>
    TravelModel.fromJson(json.decode(str));

String travelModelToJson(TravelModel data) => json.encode(data.toJson());

class TravelModel {
  String type;
  List<Feature> features;

  TravelModel({
    required this.type,
    required this.features,
  });

  factory TravelModel.fromJson(Map<String, dynamic> json) => TravelModel(
        type: json["type"],
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
      };
}

class Feature {
  FeatureType type;
  String id;
  Geometry geometry;
  Properties properties;

  Feature({
    required this.type,
    required this.id,
    required this.geometry,
    required this.properties,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: featureTypeValues.map[json["type"]]!,
        id: json["id"],
        geometry: Geometry.fromJson(json["geometry"]),
        properties: Properties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "type": featureTypeValues.reverse[type],
        "id": id,
        "geometry": geometry.toJson(),
        "properties": properties.toJson(),
      };
}

class Geometry {
  GeometryType type;
  List<double> coordinates;

  Geometry({
    required this.type,
    required this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: geometryTypeValues.map[json["type"]]!,
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": geometryTypeValues.reverse[type],
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

enum GeometryType { POINT }

final geometryTypeValues = EnumValues({"Point": GeometryType.POINT});

class Properties {
  String xid;
  String name;
  double dist;
  int rate;
  String? osm;
  String kinds;
  String? wikidata;

  Properties({
    required this.xid,
    required this.name,
    required this.dist,
    required this.rate,
    required this.osm,
    required this.kinds,
    this.wikidata,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        xid: json["xid"],
        name: json["name"],
        dist: json["dist"]?.toDouble(),
        rate: json["rate"],
        osm: json["osm"],
        kinds: json["kinds"],
        wikidata: json["wikidata"],
      );

  Map<String, dynamic> toJson() => {
        "xid": xid,
        "name": name,
        "dist": dist,
        "rate": rate,
        "osm": osm,
        "kinds": kinds,
        "wikidata": wikidata,
      };
}

enum FeatureType { FEATURE }

final featureTypeValues = EnumValues({"Feature": FeatureType.FEATURE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
