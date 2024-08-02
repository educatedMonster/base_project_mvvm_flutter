import 'package:auto_route/auto_route.dart';
import 'package:base_project_mvvm_flutter/routes/approuter.gr.dart';
import 'package:base_project_mvvm_flutter/widget/box.dart';
import 'package:base_project_mvvm_flutter/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view-models/counter_viewmodel.dart';
import '../view-models/theme_viewmodel.dart';

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CounterViewModel _counterViewModel;
  late ThemeViewModel _themeViewModel;
  int _count = 0;

  @override
  void initState() {
    _counterViewModel = context.read<CounterViewModel>();
    _themeViewModel = context.read<ThemeViewModel>();

    _count = _counterViewModel.count;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _counterViewModel = context.watch<CounterViewModel>();
    _themeViewModel = context.watch<ThemeViewModel>();

    _count = _counterViewModel.count;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Home'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_count',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.router.navigate(SecondRoute(count: _count));
                  },
                  child: const Text(
                    'Click Me',
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: MyBox(
                    color: Theme.of(context).colorScheme.primary,
                    child: MyButton(
                      color: Theme.of(context).colorScheme.secondary,
                      onTap: () {
                        _themeViewModel.toggleTheme();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _counterViewModel.setIncrementCounter();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
