import 'package:flutter/material.dart';

import '../util/spacing.dart';

class DynamicPage extends StatelessWidget {
  final String title;

  const DynamicPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final grid = GridSystem.of(context);

    return Padding(
      padding: EdgeInsets.all(grid.spacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          SizedBox(height: grid.spacing),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: grid.columns,
                crossAxisSpacing: grid.spacing,
                mainAxisSpacing: grid.spacing,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: Center(
                    child: Text(
                      "Card ${index + 1}",
                      style: Theme.of(context).textTheme.bodyMedium,
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
