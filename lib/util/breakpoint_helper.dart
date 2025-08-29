import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Custom helper for responsive breakpoints
class BreakpointHelper {
  static bool get isMobile => ScreenUtil().screenWidth < 600;
  static bool get isTablet => ScreenUtil().screenWidth >= 600 && ScreenUtil().screenWidth < 1024;
  static bool get isDesktop => ScreenUtil().screenWidth >= 1024;

  static String get deviceType {
    if (isDesktop) return "DESKTOP";
    if (isTablet) return "TABLET";
    return "MOBILE";
  }
}
