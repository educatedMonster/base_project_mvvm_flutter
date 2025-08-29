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
    ThemeViewModel utilityViewModel = context.watch();

    return LayoutBuilder(
      builder: (context, constraints) {
        // Decide design size based on width
        Size designSize;
        if (constraints.maxWidth >= 1440) {
          designSize = const Size(1440, 1024); // 4K / large desktop
        } else if (constraints.maxWidth >= 1024) {
          designSize = const Size(1024, 768); // desktop
        } else if (constraints.maxWidth >= 600) {
          designSize = const Size(600, 1024); // tablet
        } else {
          designSize = const Size(360, 700); // mobile
        }

        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              routerConfig: _appRouter.config(),
              debugShowCheckedModeBanner: false,
              title: Constants.titleApp,
              // theme: utilityViewModel.themeData,
              // theme: ThemeData(
              //   primarySwatch: Colors.blue,
              //   textTheme: TextTheme(
              //     bodySmall: TextStyle(fontSize: 12.sp),
              //     bodyMedium: TextStyle(fontSize: 14.sp),
              //     bodyLarge: TextStyle(fontSize: 16.sp),
              //     headlineSmall: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              //     headlineMedium: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              //     headlineLarge: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              //   ),
              // ),
              theme: utilityViewModel.buildResponsiveTheme(),
              builder: EasyLoading.init(
                builder: (context, widget) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaler: const TextScaler.linear(1.0),
                    ),
                    child: widget!,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
