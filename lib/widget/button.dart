import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.color,
    this.onTap,
  });

  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0).r,
        ),
        padding: const EdgeInsets.all(25.0).r,
        margin: const EdgeInsets.all(25.0).r,
        child: Center(
          child: Text(
            'TAP',
            style: TextStyle(
              fontSize: 12.0.sp,
            ),
          ),
        ),
      ),
    );
  }
}
