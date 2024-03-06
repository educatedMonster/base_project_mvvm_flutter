import 'package:base_project_mvvm_flutter/view-models/theme_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../view-models/counter_viewmodel.dart';
import 'routes/approuter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterViewModel()),
      ChangeNotifierProvider(create: (context) => ThemeViewModel()),
    ],
    builder: (context, child) => ResponsiveBreakpoints.builder(
      child: child!,
      breakpoints: [
        const Breakpoint(start: 0, end: 450, name: MOBILE),
        const Breakpoint(start: 451, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
    ),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // make sure you don't initiate your router
  // inside of the build function.
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeViewModel themeViewModel = context.watch<ThemeViewModel>();

    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Base Project MVVM Flutter',
      // theme: themeViewModel.themeData,
      theme: Provider.of<ThemeViewModel>(context).themeData,
      builder: EasyLoading.init(
        builder: (builder, widget) => ResponsiveScaledBox(
          width: ResponsiveValue<double>(context, conditionalValues: [
            Condition.equals(name: MOBILE, value: 450),
            Condition.between(start: 800, end: 1100, value: 800),
            Condition.between(start: 1000, end: 1200, value: 1000),
            // There are no conditions for width over 1200
            // because the `maxWidth` is set to 1200 via the MaxWidthBox.
          ]).value,
          child: widget!,
        ),
      ),
    );
  }
}
