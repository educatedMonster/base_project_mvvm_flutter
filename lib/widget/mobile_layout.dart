import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/spacing.dart';

class MobileLayout extends StatelessWidget {
  final SpacingSystem spacing;

  const MobileLayout({
    super.key,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(spacing.medium),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone_android, size: 80.sp, color: Colors.indigo),
            SizedBox(height: spacing.small),
            Text("Mobile Layout",
                style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: spacing.small),
            Text("This is body text for mobile.",
                style: Theme.of(context).textTheme.bodyMedium),
            Text("Caption example",
                style: Theme.of(context).textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
