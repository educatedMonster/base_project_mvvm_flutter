import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../routes/approuter.gr.dart';
import '../constants/constants.dart';

@RoutePage()
class MySplashPage extends StatefulWidget {
  const MySplashPage({super.key});

  @override
  State<MySplashPage> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage>
    with WidgetsBindingObserver {
  late AppLifecycleState _state;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    Timer(const Duration(seconds: 6), () {
      context.router.replaceAll([const MyHomeRoute()]);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                Constants.assetSplashLogo,
                width: MediaQuery.of(context).size.width / 2, // Adjust the width and height as needed
                height: MediaQuery.of(context).size.height / 2, // Adjust the width and height as needed
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _state = state;
    debugPrint('$state');
    debugPrint(":::::::");

    if (_state == AppLifecycleState.inactive ||
        _state == AppLifecycleState.detached) {
      debugPrint(_state.name);
    }

    final isBackground = state == AppLifecycleState.paused;
    if (isBackground) {
      debugPrint(_state.name);
    } else {
      debugPrint(_state.name);
    }

    // switch (_state) {
    //   case AppLifecycleState.resumed:
    //     // --
    //     print('Resumed');
    //     break;
    //   case AppLifecycleState.inactive:
    //     // --
    //     print('Inactive');
    //     break;
    //   case AppLifecycleState.paused:
    //     // --
    //     print('Paused');
    //     break;
    //   case AppLifecycleState.detached:
    //     // --
    //     print('Detached');
    //     break;
    //   case AppLifecycleState.hidden:
    //     // A new **hidden** state has been introduced in latest flutter version
    //     print('Hidden');
    //     break;
    // }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
