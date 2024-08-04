import 'package:base_project_mvvm_flutter/view-models/theme_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../view-models/counter_viewmodel.dart';
import 'constants/constants.dart';
import 'routes/approuter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterViewModel()),
      ChangeNotifierProvider(create: (context) => ThemeViewModel()),
    ],
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
    ThemeViewModel utilityViewModel = context.watch<ThemeViewModel>();
    return ScreenUtilInit(
      designSize: const Size(360, 700),
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
        title: Constants.titleApp,
        theme: utilityViewModel.themeData,
        builder: EasyLoading.init(
          builder: (builder, widget) {
            return MediaQuery(
              ///Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: widget!,
            );
          },
        ),
      ),
    );
  }
}
