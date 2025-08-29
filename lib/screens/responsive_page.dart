import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../util/spacing.dart';
import '../widget/layout_example.dart';
import '../widget/responsive_widget.dart';

@RoutePage()
class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = SpacingSystem.of(context);
    final radius = RadiusSystem.of(context);
    final elevation = ElevationSystem.of(context);
    final icons = IconSystem.of(context);
    final images = ImageSystem.of(context);
    final grid = GridSystem.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Page",
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: ResponsiveWidget(
        mobile: LayoutExample(
          label: "Mobile Layout",
          icon: Icons.phone_android,
          spacing: spacing,
          radius: radius,
          elevation: elevation,
          icons: icons,
          images: images,
          grid: grid,
        ),
        tablet: LayoutExample(
          label: "Tablet Layout",
          icon: Icons.tablet,
          spacing: spacing,
          radius: radius,
          elevation: elevation,
          icons: icons,
          images: images,
          grid: grid,
        ),
        desktop: LayoutExample(
          label: "Desktop Layout",
          icon: Icons.desktop_windows,
          spacing: spacing,
          radius: radius,
          elevation: elevation,
          icons: icons,
          images: images,
          grid: grid,
        ),
      ),
    );
  }
}
