import 'package:flutter/material.dart';

import 'first_route.dart';

import 'main_screen.dart';

void main() => runApp(HeroApp());

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Transition Demo',
      // home: MainScreen(),
      title: 'Navigation Basics',
      home: FirstRoute(),
    );
  }
}
