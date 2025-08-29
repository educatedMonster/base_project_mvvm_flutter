import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../util/transitions.dart';
import 'approuter.gr.dart';

/*@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: "/", initial: true, page: MySplashRoute.page),
        AutoRoute(path: "/home", page: MyHomeRoute.page),
        AutoRoute(path: "/second", page: SecondRoute.page),
      ];
}*/

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      path: '/',
      page: ResponsiveAppLayoutRoute.page,
      initial: true,
      // transitionsBuilder: TransitionsBuilders.fadeIn,
      transitionsBuilder: customScaleFadeTransition, // ✅ main layout
      durationInMilliseconds: 450,
      children: [
        CustomRoute(
          path: 'dashboard',
          page: DashboardRoute.page,
          // transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          transitionsBuilder: customScaleFadeTransition, // ✅ Dashboard,
          durationInMilliseconds: 450,
        ),
        CustomRoute(
          path: 'reports',
          page: ReportsRoute.page,
          // transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          transitionsBuilder: customSlideFadeTransition, // ✅ Reports,
          // durationInMilliseconds: 450,
        ),
        CustomRoute(
          path: 'service-request',
          page: ServiceRequestRoute.page,
          // transitionsBuilder: TransitionsBuilders.zoomIn,
          transitionsBuilder: customRotateFadeTransition, // ✅ Service Request,
          durationInMilliseconds: 450,
        ),
      ],
    ),
  ];
}
