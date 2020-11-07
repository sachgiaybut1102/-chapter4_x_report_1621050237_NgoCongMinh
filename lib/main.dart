import 'package:flutter/material.dart';

import 'first_route.dart';

import 'first_screen.dart';
import 'main_screen.dart';
import 'second_screen.dart';

void main() => runApp(HeroApp());

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Ex1
      // title: 'Transition Demo',
      // home: MainScreen(),
      //Ex2
      // title: 'Navigation Basics',
      // home: FirstRoute(),
      //Ex3
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
      },
    );
  }
}
