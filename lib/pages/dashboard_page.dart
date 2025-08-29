import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/spacing.dart';
import '../widget/dashboard_card.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello, Kervin 👋",
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
              Text("Welcome back to your dashboard",
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
            ],
          ),
          CircleAvatar(
            radius: 24.r,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=5"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final grid = GridSystem.of(context);

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          Expanded(
            child: GridView.builder(
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: grid.columns,
                crossAxisSpacing: grid.spacing,
                mainAxisSpacing: grid.spacing,
                childAspectRatio: 4 / 3,
              ),
              itemBuilder: (context, index) {
                return DashboardCard(
                  title: "Card ${index + 1}",
                  icon: Icons.dashboard,
                  color: Colors.blueAccent,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

