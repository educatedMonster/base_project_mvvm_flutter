import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'breakpoint_helper.dart';

/// 🔹 Responsive Spacing
class SpacingSystem {
  final String breakpoint;
  SpacingSystem(this.breakpoint);

  double get small => (breakpoint == "DESKTOP") ? 16.w : (breakpoint == "TABLET") ? 12.w : 8.w;
  double get medium => (breakpoint == "DESKTOP") ? 24.w : (breakpoint == "TABLET") ? 20.w : 16.w;
  double get large => (breakpoint == "DESKTOP") ? 40.w : (breakpoint == "TABLET") ? 32.w : 24.w;

  static SpacingSystem of(BuildContext context) => SpacingSystem(BreakpointHelper.deviceType);
}

/// 🔹 Responsive Radius
class RadiusSystem {
  final String breakpoint;
  RadiusSystem(this.breakpoint);

  double get small => (breakpoint == "DESKTOP") ? 8.r : (breakpoint == "TABLET") ? 6.r : 4.r;
  double get medium => (breakpoint == "DESKTOP") ? 16.r : (breakpoint == "TABLET") ? 12.r : 8.r;
  double get large => (breakpoint == "DESKTOP") ? 24.r : (breakpoint == "TABLET") ? 20.r : 16.r;

  static RadiusSystem of(BuildContext context) => RadiusSystem(BreakpointHelper.deviceType);
}


/// 🔹 Responsive Elevation (shadows)
class ElevationSystem {
  final String breakpoint;
  ElevationSystem(this.breakpoint);

  double get low => (breakpoint == "DESKTOP") ? 4 : (breakpoint == "TABLET") ? 3 : 2;
  double get medium => (breakpoint == "DESKTOP") ? 8 : (breakpoint == "TABLET") ? 6 : 4;
  double get high => (breakpoint == "DESKTOP") ? 12 : (breakpoint == "TABLET") ? 10 : 8;

  static ElevationSystem of(BuildContext context) => ElevationSystem(BreakpointHelper.deviceType);
}

/// 🔹 Responsive Icon Sizes
class IconSystem {
  final String breakpoint;
  IconSystem(this.breakpoint);

  double get small => (breakpoint == "DESKTOP") ? 32.sp : (breakpoint == "TABLET") ? 28.sp : 24.sp;
  double get medium => (breakpoint == "DESKTOP") ? 48.sp : (breakpoint == "TABLET") ? 40.sp : 32.sp;
  double get large => (breakpoint == "DESKTOP") ? 72.sp : (breakpoint == "TABLET") ? 60.sp : 48.sp;

  static IconSystem of(BuildContext context) => IconSystem(BreakpointHelper.deviceType);
}

/// 🔹 Responsive Image Sizes
class ImageSystem {
  final String breakpoint;
  ImageSystem(this.breakpoint);

  /// Profile picture / avatar
  double get avatar => (breakpoint == "DESKTOP") ? 120.w : (breakpoint == "TABLET") ? 90.w : 60.w;

  /// Thumbnails (e.g. product previews, gallery)
  double get thumbnail => (breakpoint == "DESKTOP") ? 180.w : (breakpoint == "TABLET") ? 140.w : 100.w;

  /// Banner / hero images
  double get bannerHeight => (breakpoint == "DESKTOP") ? 400.h : (breakpoint == "TABLET") ? 300.h : 200.h;

  static ImageSystem of(BuildContext context) => ImageSystem(BreakpointHelper.deviceType);
}

/// 🔹 Responsive Grid Columns
class GridSystem {
  final String breakpoint;
  GridSystem(this.breakpoint);

  /// Number of columns based on breakpoint
  int get columns {
    switch (breakpoint) {
      case "DESKTOP": return 4;
      case "TABLET": return 2;
      default: return 1;
    }
  }

  /// Spacing between grid items
  double get spacing {
    switch (breakpoint) {
      case "DESKTOP": return 24.w;
      case "TABLET": return 16.w;
      default: return 12.w;
    }
  }

  static GridSystem of(BuildContext context) => GridSystem(BreakpointHelper.deviceType);
}

/// 🔹 Responsive Navigation System
class NavigationSystem {
  final String breakpoint;
  NavigationSystem(this.breakpoint);

  bool get isMobile => breakpoint == "MOBILE";
  bool get isTablet => breakpoint == "TABLET";
  bool get isDesktop => breakpoint == "DESKTOP";

  static NavigationSystem of(BuildContext context) => NavigationSystem(BreakpointHelper.deviceType);
}

