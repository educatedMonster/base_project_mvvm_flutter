import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
