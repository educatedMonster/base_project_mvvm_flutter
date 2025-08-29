// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:base_project_mvvm_flutter/layout/responsive_app_layout_page.dart'
    as _i6;
import 'package:base_project_mvvm_flutter/pages/dashboard_page.dart' as _i1;
import 'package:base_project_mvvm_flutter/pages/reports_page.dart' as _i5;
import 'package:base_project_mvvm_flutter/pages/service_request_page.dart'
    as _i9;
import 'package:base_project_mvvm_flutter/screens/fourth_page.dart' as _i2;
import 'package:base_project_mvvm_flutter/screens/my_home_page.dart' as _i3;
import 'package:base_project_mvvm_flutter/screens/my_splash_page.dart' as _i4;
import 'package:base_project_mvvm_flutter/screens/responsive_page.dart' as _i7;
import 'package:base_project_mvvm_flutter/screens/second_page.dart' as _i8;
import 'package:base_project_mvvm_flutter/screens/third_page.dart' as _i10;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    FourthRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FourthPage(),
      );
    },
    MyHomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MyHomePage(),
      );
    },
    MySplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MySplashPage(),
      );
    },
    ReportsRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ReportsPage(),
      );
    },
    ResponsiveAppLayoutRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ResponsiveAppLayoutPage(),
      );
    },
    ResponsiveRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ResponsivePage(),
      );
    },
    SecondRoute.name: (routeData) {
      final args = routeData.argsAs<SecondRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SecondPage(
          key: args.key,
          count: args.count,
        ),
      );
    },
    ServiceRequestRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ServiceRequestPage(),
      );
    },
    ThirdRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ThirdPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i11.PageRouteInfo<void> {
  const DashboardRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FourthPage]
class FourthRoute extends _i11.PageRouteInfo<void> {
  const FourthRoute({List<_i11.PageRouteInfo>? children})
      : super(
          FourthRoute.name,
          initialChildren: children,
        );

  static const String name = 'FourthRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MyHomePage]
class MyHomeRoute extends _i11.PageRouteInfo<void> {
  const MyHomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MySplashPage]
class MySplashRoute extends _i11.PageRouteInfo<void> {
  const MySplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MySplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'MySplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ReportsPage]
class ReportsRoute extends _i11.PageRouteInfo<void> {
  const ReportsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ReportsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportsRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ResponsiveAppLayoutPage]
class ResponsiveAppLayoutRoute extends _i11.PageRouteInfo<void> {
  const ResponsiveAppLayoutRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ResponsiveAppLayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResponsiveAppLayoutRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ResponsivePage]
class ResponsiveRoute extends _i11.PageRouteInfo<void> {
  const ResponsiveRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ResponsiveRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResponsiveRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SecondPage]
class SecondRoute extends _i11.PageRouteInfo<SecondRouteArgs> {
  SecondRoute({
    _i12.Key? key,
    required int count,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SecondRoute.name,
          args: SecondRouteArgs(
            key: key,
            count: count,
          ),
          initialChildren: children,
        );

  static const String name = 'SecondRoute';

  static const _i11.PageInfo<SecondRouteArgs> page =
      _i11.PageInfo<SecondRouteArgs>(name);
}

class SecondRouteArgs {
  const SecondRouteArgs({
    this.key,
    required this.count,
  });

  final _i12.Key? key;

  final int count;

  @override
  String toString() {
    return 'SecondRouteArgs{key: $key, count: $count}';
  }
}

/// generated route for
/// [_i9.ServiceRequestPage]
class ServiceRequestRoute extends _i11.PageRouteInfo<void> {
  const ServiceRequestRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ServiceRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServiceRequestRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ThirdPage]
class ThirdRoute extends _i11.PageRouteInfo<void> {
  const ThirdRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ThirdRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThirdRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
