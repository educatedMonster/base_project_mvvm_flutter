import 'package:flutter/material.dart';

class Constants {
  /// Live Chat
  static const licenseNo = '13948944';
  static const groupId = '0';

  /// Dialog
  static const titleApp = "Sample App";

  /// SmtpServer
  static const smtpUsername = "alerts@servoitsolutions.ph";
  static const smtpPassword = "qthbpjshctgjnxpw";


  /// Color
  static const primaryColor = Color.fromRGBO(37, 44, 126, 1); // #2b3493
  static const secondaryColor = Color.fromRGBO(99, 115, 129, 1); // #637381


  static Color grayColor({
    required double opacity,
  }) {
    return Color.fromRGBO(244, 246, 248, opacity);
  }

  static Color whiteColor({
    required double opacity,
  }) {
    return Color.fromRGBO(255, 255, 255, opacity); // #E9EAF4
  }

  static Color blackColor({
    required double opacity,
  }) {
    return Color.fromRGBO(33, 43, 54, opacity); // #212B36
  }

  /// Image Assets
  static const assetMyIcon = "assets/images/my_icon.png";
  static const assetSplashLogo = "assets/images/servo_logo.gif";
}
