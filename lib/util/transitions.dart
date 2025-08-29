import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// ✅ Scale + Fade (modern bounce)
Widget customScaleFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      // curve: Curves.easeInOut,
      curve: getAdaptiveCurve(context),
    ),
    child: ScaleTransition(
      scale: Tween<double>(begin: 0.95, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          // curve: Curves.easeOutBack,
          curve: getAdaptiveCurve(context),
        ),
      ),
      child: child,
    ),
  );
}

/// ✅ Slide from bottom + Fade
Widget customSlideFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 0.2),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: animation,
    // curve: Curves.easeOutCubic,
    curve: getAdaptiveCurve(context),
  ));

  return SlideTransition(
    position: offsetAnimation,
    child: FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeIn,
      ),
      child: child,
    ),
  );
}

/// ✅ Rotate + Fade (for fun settings vibe)
Widget customRotateFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: animation,
    child: RotationTransition(
      turns: Tween<double>(begin: 0.97, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          // curve: Curves.easeOutBack,
          curve: getAdaptiveCurve(context),
        ),
      ),
      child: child,
    ),
  );
}

/// Get adaptive curve depending on device type
Curve getAdaptiveCurve(BuildContext context) {
  switch (ScreenUtil().deviceType(context)) {
    case DeviceType.mobile: return Curves.easeOutBack; // playful bounce
    case DeviceType.tablet: return Curves.easeInOut; // balanced
    case DeviceType.web: return Curves.easeInOutCubic; // elegant, smoother
    default: return Curves.easeInOut;
  }
}

/// Pick transition duration based on device type
int getTransitionDuration(BuildContext context) {
  switch (ScreenUtil().deviceType(context)) {
    case DeviceType.mobile: return 300; // fast
    case DeviceType.tablet: return 400; // medium
    case DeviceType.web: return 600; // smooth & elegant
    default: return 400;
  }
}
