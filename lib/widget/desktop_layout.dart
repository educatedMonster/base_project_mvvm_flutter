import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/spacing.dart';

class DesktopLayout extends StatelessWidget {
  final SpacingSystem spacing;

  const DesktopLayout({super.key, required this.spacing});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          destinations: const [
            NavigationRailDestination(
                icon: Icon(Icons.dashboard), label: Text("Dashboard")),
            NavigationRailDestination(
                icon: Icon(Icons.settings), label: Text("Settings")),
          ],
          selectedIndex: 0,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(spacing.large),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.desktop_windows,
                      size: 120.sp, color: Colors.indigo),
                  SizedBox(height: spacing.large),
                  Text("Desktop Layout",
                      style: Theme.of(context).textTheme.headlineLarge),
                  SizedBox(height: spacing.medium),
                  Text("This is body text for desktop.",
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
