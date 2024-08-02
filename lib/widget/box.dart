import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBox extends StatelessWidget {
  const MyBox({
    super.key,
    this.child,
    this.color,
  });

  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0).r,
      ),
      width: 200.0.w,
      height: 200.0.h,
      padding: const EdgeInsets.all(50.0).r,
      child: child,
    );
  }
}
