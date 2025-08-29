import 'package:flutter/material.dart';

import '../util/spacing.dart';

/*class LayoutExample extends StatelessWidget {
  final String label;
  final IconData icon;
  final SpacingSystem spacing;
  final RadiusSystem radius;
  final ElevationSystem elevation;
  final IconSystem icons;
  final ImageSystem images;

  const LayoutExample({
    super.key,
    required this.label,
    required this.icon,
    required this.spacing,
    required this.radius,
    required this.elevation,
    required this.icons,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(spacing.medium),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 🔹 Avatar
            CircleAvatar(
              radius: images.avatar / 2,
              backgroundImage: const NetworkImage("https://i.pravatar.cc/300"),
            ),
            SizedBox(height: spacing.small),

            /// 🔹 Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(radius.large),
              child: Container(
                height: images.bannerHeight,
                width: double.infinity,
                color: Colors.indigo.shade100,
                child: Icon(icon, size: icons.large, color: Colors.indigo),
              ),
            ),

            SizedBox(height: spacing.small),

            /// 🔹 Card with Thumbnail
            Material(
              elevation: elevation.medium,
              borderRadius: BorderRadius.circular(radius.large),
              child: Container(
                width: images.thumbnail,
                height: images.thumbnail,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius.medium),
                  image: const DecorationImage(
                    image: NetworkImage("https://picsum.photos/200"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(height: spacing.small),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: elevation.low,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius.medium),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: spacing.large,
                  vertical: spacing.small,
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.touch_app, size: icons.small),
              label: Text("Click Me",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }
}*/

class LayoutExample extends StatelessWidget {
  final String label;
  final IconData icon;
  final SpacingSystem spacing;
  final RadiusSystem radius;
  final ElevationSystem elevation;
  final IconSystem icons;
  final ImageSystem images;
  final GridSystem grid;

  const LayoutExample({
    super.key,
    required this.label,
    required this.icon,
    required this.spacing,
    required this.radius,
    required this.elevation,
    required this.icons,
    required this.images,
    required this.grid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(spacing.medium),
      child: Column(
        children: [
          Text(label, style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(height: spacing.medium),

          /// 🔹 Responsive Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: grid.columns,
                crossAxisSpacing: grid.spacing,
                mainAxisSpacing: grid.spacing,
                childAspectRatio: 1,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Material(
                  elevation: elevation.medium,
                  borderRadius: BorderRadius.circular(radius.medium),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius.medium),
                      color: Colors.indigo.shade100,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image,
                        size: icons.medium,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
