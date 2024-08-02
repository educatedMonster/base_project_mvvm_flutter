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
  late CounterViewModel counterViewModel;
  late ThemeViewModel themeViewModel;

  @override
  void initState() {
    counterViewModel = context.read<CounterViewModel>();
    themeViewModel = context.read<ThemeViewModel>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    counterViewModel = context.watch<CounterViewModel>();
    themeViewModel = context.watch<ThemeViewModel>();

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
                      '${counterViewModel.count}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    context.router
                        .navigate(SecondRoute(count: counterViewModel.count));
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
                        themeViewModel.toggleTheme();
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
            counterViewModel.setIncrementCounter();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.

      ),
    );
  }
}
