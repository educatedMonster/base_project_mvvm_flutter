// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:base_project_mvvm_flutter/screens/my_home_page.dart' as _i1;
import 'package:base_project_mvvm_flutter/screens/my_splash_page.dart' as _i2;
import 'package:base_project_mvvm_flutter/screens/second_page.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MyHomePage(),
      );
    },
    MySplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MySplashPage(),
      );
    },
    SecondRoute.name: (routeData) {
      final args = routeData.argsAs<SecondRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.SecondPage(
          key: args.key,
          count: args.count,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i4.PageRouteInfo<void> {
  const MyHomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MySplashPage]
class MySplashRoute extends _i4.PageRouteInfo<void> {
  const MySplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MySplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'MySplashRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SecondPage]
class SecondRoute extends _i4.PageRouteInfo<SecondRouteArgs> {
  SecondRoute({
    _i5.Key? key,
    required int count,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          SecondRoute.name,
          args: SecondRouteArgs(
            key: key,
            count: count,
          ),
          initialChildren: children,
        );

  static const String name = 'SecondRoute';

  static const _i4.PageInfo<SecondRouteArgs> page =
      _i4.PageInfo<SecondRouteArgs>(name);
}

class SecondRouteArgs {
  const SecondRouteArgs({
    this.key,
    required this.count,
  });

  final _i5.Key? key;

  final int count;

  @override
  String toString() {
    return 'SecondRouteArgs{key: $key, count: $count}';
  }
}
