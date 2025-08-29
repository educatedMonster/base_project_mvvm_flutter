import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/spacing.dart';

class TabletLayout extends StatelessWidget {
  final SpacingSystem spacing;

  const TabletLayout({super.key, required this.spacing});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.indigo.shade100,
            child: Center(
              child: Text("Sidebar",
                  style: Theme.of(context).textTheme.labelSmall),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(spacing.large),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.tablet, size: 100.sp, color: Colors.indigo),
                  SizedBox(height: spacing.medium),
                  Text("Tablet Layout",
                      style: Theme.of(context).textTheme.headlineLarge),
                  SizedBox(height: spacing.small),
                  Text("This is body text for tablet.",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
