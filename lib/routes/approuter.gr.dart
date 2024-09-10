// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:base_project_mvvm_flutter/screens/fourth_page.dart' as _i1;
import 'package:base_project_mvvm_flutter/screens/my_home_page.dart' as _i2;
import 'package:base_project_mvvm_flutter/screens/my_splash_page.dart' as _i3;
import 'package:base_project_mvvm_flutter/screens/second_page.dart' as _i4;
import 'package:base_project_mvvm_flutter/screens/third_page.dart' as _i5;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    FourthRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.FourthPage(),
      );
    },
    MyHomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MyHomePage(),
      );
    },
    MySplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MySplashPage(),
      );
    },
    SecondRoute.name: (routeData) {
      final args = routeData.argsAs<SecondRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SecondPage(
          key: args.key,
          count: args.count,
        ),
      );
    },
    ThirdRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ThirdPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.FourthPage]
class FourthRoute extends _i6.PageRouteInfo<void> {
  const FourthRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FourthRoute.name,
          initialChildren: children,
        );

  static const String name = 'FourthRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MyHomePage]
class MyHomeRoute extends _i6.PageRouteInfo<void> {
  const MyHomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MySplashPage]
class MySplashRoute extends _i6.PageRouteInfo<void> {
  const MySplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MySplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'MySplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SecondPage]
class SecondRoute extends _i6.PageRouteInfo<SecondRouteArgs> {
  SecondRoute({
    _i7.Key? key,
    required int count,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          SecondRoute.name,
          args: SecondRouteArgs(
            key: key,
            count: count,
          ),
          initialChildren: children,
        );

  static const String name = 'SecondRoute';

  static const _i6.PageInfo<SecondRouteArgs> page =
      _i6.PageInfo<SecondRouteArgs>(name);
}

class SecondRouteArgs {
  const SecondRouteArgs({
    this.key,
    required this.count,
  });

  final _i7.Key? key;

  final int count;

  @override
  String toString() {
    return 'SecondRouteArgs{key: $key, count: $count}';
  }
}

/// generated route for
/// [_i5.ThirdPage]
class ThirdRoute extends _i6.PageRouteInfo<void> {
  const ThirdRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ThirdRoute.name,
          initialChildren: children,
        );

  static const String name = 'ThirdRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
