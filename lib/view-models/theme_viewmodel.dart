import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/theme.dart';
import '../util/breakpoint_helper.dart';

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

  /// 🔹 Define responsive text styles per breakpoint
  ThemeData buildResponsiveTheme() {
    final bp = BreakpointHelper.deviceType;

    double h1, title, body, caption;
    switch (bp) {
      case "TABLET":
        h1 = 26.sp;
        title = 22.sp;
        body = 18.sp;
        caption = 14.sp;
        break;
      case "DESKTOP":
        h1 = 32.sp;
        title = 24.sp;
        body = 20.sp;
        caption = 16.sp;
        break;
      default: // MOBILE
        h1 = 18.sp;
        title = 14.sp;
        body = 12.sp;
        caption = 10.sp;
    }

    return ThemeData(
      primarySwatch: Colors.indigo,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      // textTheme: GoogleFonts.poppinsTextTheme(),
      useMaterial3: true,
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.rubik(
          textStyle: TextStyle(fontSize: h1, fontWeight: FontWeight.bold),
        ),
        titleMedium: GoogleFonts.rubik(
          textStyle: TextStyle(fontSize: title, fontWeight: FontWeight.w500),
        ),
        bodyMedium: GoogleFonts.rubik(
          textStyle: TextStyle(fontSize: body),
        ),
        labelSmall: GoogleFonts.rubik(
          textStyle: TextStyle(fontSize: caption, color: Colors.grey[700]),
        ),
      ),
    );
  }
}
