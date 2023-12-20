import 'package:auto_route/auto_route.dart';

import 'approuter.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: "/home", initial: true, page: MyHomeRoute.page),
        AutoRoute(page: SecondRoute.page),
      ];
}
