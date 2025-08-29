import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routes/approuter.gr.dart';
import '../screens/dynamic_page.dart';
import '../util/spacing.dart';

@RoutePage()
class ResponsiveAppLayoutPage extends StatefulWidget {
  const ResponsiveAppLayoutPage({super.key});

  @override
  State<ResponsiveAppLayoutPage> createState() => _ResponsiveAppLayoutPageState();
}

/*class _ResponsiveAppLayoutPageState extends State<ResponsiveAppLayoutPage> {
  int _selectedIndex = 0;

  final _pages = const [
    DynamicPage(title: "Dashboard"),
    DynamicPage(title: "Reports"),
    DynamicPage(title: "Settings"),
  ];

  @override
  Widget build(BuildContext context) {
    final nav = NavigationSystem.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive App"),
      ),

      /// --- Body depends on screen size
      body: nav.isDesktop
          ? Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) =>
                      setState(() => _selectedIndex = index),
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.dashboard),
                      label: Text("Dashboard"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.bar_chart),
                      label: Text("Reports"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text("Settings"),
                    ),
                  ],
                ),
                Expanded(child: _pages[_selectedIndex]),
              ],
            )
          : _pages[_selectedIndex],

      /// --- Bottom Nav for Mobile
      bottomNavigationBar: nav.isMobile
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
                BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Reports"),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
              ],
            )
          : null,

      /// --- Drawer for Tablet
      drawer: nav.isTablet
          ? Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    child: Text("Menu", style: TextStyle(fontSize: 20)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.dashboard),
                    title: const Text("Dashboard"),
                    selected: _selectedIndex == 0,
                    onTap: () => setState(() => _selectedIndex = 0),
                  ),
                  ListTile(
                    leading: const Icon(Icons.bar_chart),
                    title: const Text("Reports"),
                    selected: _selectedIndex == 1,
                    onTap: () => setState(() => _selectedIndex = 1),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    selected: _selectedIndex == 2,
                    onTap: () => setState(() => _selectedIndex = 2),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}*/

class _ResponsiveAppLayoutPageState extends State<ResponsiveAppLayoutPage> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      body: Row(
        children: [
          if (isDesktop)
            NavigationRail(
              selectedIndex: _getSelectedIndex(context),
              onDestinationSelected: (index) {
                switch (index) {
                  case 0:
                    context.router.replace(const DashboardRoute());
                    break;
                  case 1:
                    context.router.replace(const ReportsRoute());
                    break;
                  case 2:
                    context.router.replace(const ServiceRequestRoute());
                    break;
                }
              },
              destinations: const [
                NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text("Dashboard")),
                NavigationRailDestination(icon: Icon(Icons.bar_chart), label: Text("Reports")),
                NavigationRailDestination(icon: Icon(Icons.home_repair_service), label: Text("Service Request")),
              ],
            ),
          const Expanded(child: AutoRouter()),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : BottomNavigationBar(
              currentIndex: _getSelectedIndex(context),
              onTap: (index) {
                switch (index) {
                  case 0:
                    context.router.replace(const DashboardRoute());
                    break;
                  case 1:
                    context.router.replace(const ReportsRoute());
                    break;
                  case 2:
                    context.router.replace(const ServiceRequestRoute());
                    break;
                }
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
                BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Reports"),
                BottomNavigationBarItem(icon: Icon(Icons.home_repair_service), label: "Service Request"),
              ],
            ),

      // floatingActionButton: const FloatingToggleTheme(),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final routeName = context.router.current.name;
    switch (routeName) {
      case DashboardRoute.name:
        return 0;
      case ReportsRoute.name:
        return 1;
      case ServiceRequestRoute.name:
        return 2;
      default:
        return 0;
    }
  }
}

