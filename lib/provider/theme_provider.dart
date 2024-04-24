import 'package:flutter/material.dart';
import 'package:travel_companion/components/dark_mode.dart';
import 'package:travel_companion/components/light_mode.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = lightmode;

  ThemeData get themedata => _themeData;
  bool get isDarkMode => themedata == darkmode;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
  }
}
