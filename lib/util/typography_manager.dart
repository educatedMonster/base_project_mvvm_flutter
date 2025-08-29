import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Responsive Typography Manager
class TypographyManager {
  final String breakpoint;

  TypographyManager(this.breakpoint);

  double get h1 {
    switch (breakpoint) {
      case "TABLET":
        return 26.sp;
      case "DESKTOP":
        return 32.sp;
      default:
        return 22.sp;
    }
  }

  double get body {
    switch (breakpoint) {
      case "TABLET":
        return 18.sp;
      case "DESKTOP":
        return 20.sp;
      default:
        return 14.sp;
    }
  }

  double get caption {
    switch (breakpoint) {
      case "TABLET":
        return 14.sp;
      case "DESKTOP":
        return 16.sp;
      default:
        return 12.sp;
    }
  }
}
