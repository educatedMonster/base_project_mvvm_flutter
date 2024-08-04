import '../theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeViewModel with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
      notifyListeners();
    } else {
      _themeData = lightMode;
      notifyListeners();
    }
  }
}
