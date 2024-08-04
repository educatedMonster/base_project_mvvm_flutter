import 'package:auto_route/auto_route.dart';

import 'approuter.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: "/", initial: true, page: MySplashRoute.page),
        AutoRoute(path: "/home", page: MyHomeRoute.page),
        AutoRoute(path: "/second", page: SecondRoute.page),
      ];
}
