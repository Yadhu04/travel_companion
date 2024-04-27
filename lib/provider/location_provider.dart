// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
import 'package:travel_companion/models/location_finder_model.dart';
import 'package:travel_companion/models/travel_model.dart';
// import 'package:travel_companion/provider/info_provider.dart';

class LocationProvider extends ChangeNotifier {
  // var info = Provider.of<InfoProvider>(context as BuildContext, listen: false);
  // TextEditingController _destinationController= TextEditingController();
  double long = 0.0;
  double lat = 0.0;
  TravelModel? data;
  TextEditingController destinationController = TextEditingController();
  int dateIndex = 10;
  List<Feature>? places;

  // datechange(int? index) {
  //   dateIndex = (index! * 5);
  //   notifyListeners();
  // }

  fetchLocation({required String location}) async {
    String uri =
        'https://api.opentripmap.com/0.1/en/places/geoname?name=$location&apikey=5ae2e3f221c38a28845f05b6bb401ef0f6e424a2ef398b09bc6988bc';
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      LocationFinder model = locationFinderFromJson(response.body);
      long = model.lon;
      lat = model.lat;
      // fetchdata();
      notifyListeners();
      print('$lat and $long');
    } else {
      print('Error');
    }
  }

  fetchdata() async {
    String url =
        'https://api.opentripmap.com/0.1/en/places/radius?radius=100000&lon=$long&lat=$lat&rate=3&limit=50&apikey=5ae2e3f221c38a28845f05b6bb401ef0f6e424a2ef398b09bc6988bc';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var model = travelModelFromJson(response.body);
      data = model;
      // places = data?.features;

      print('fetch dta function');
      notifyListeners();
    } else {
      print('Location not fetched');
    }
  }
}
