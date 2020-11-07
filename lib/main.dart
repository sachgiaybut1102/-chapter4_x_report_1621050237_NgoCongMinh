import 'package:flutter/material.dart';

import 'extract_arguments_screen.dart';
import 'first_route.dart';

import 'first_screen.dart';
import 'home_screen.dart';
import 'main_screen.dart';
import 'pass_arguments_screen.dart';
import 'screen_arguments.dart';
import 'second_screen.dart';

import 'home_screen_ex5.dart';

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
      // title: 'Named Routes Demo',
      // // Start the app with the "/" named route. In this case, the app starts
      // // on the FirstScreen widget.
      // initialRoute: '/',
      // routes: {
      //   // When navigating to the "/" route, build the FirstScreen widget.
      //   '/': (context) => FirstScreen(),
      //   // When navigating to the "/second" route, build the SecondScreen widget.
      //   '/second': (context) => SecondScreen(),
      // },
      //Ex4
      // onGenerateRoute: (settings) {
      //   // If you push the PassArguments route
      //   if (settings.name == PassArgumentsScreen.routeName) {
      //     // Cast the arguments to the correct type: ScreenArguments.
      //     final ScreenArguments args = settings.arguments;

      //     // Then, extract the required data from the arguments and
      //     // pass the data to the correct screen.
      //     return MaterialPageRoute(
      //       builder: (context) {
      //         return PassArgumentsScreen(
      //           title: args.title,
      //           message: args.message,
      //         );
      //       },
      //     );
      //   }
      //   // The code only supports PassArgumentsScreen.routeName right now.
      //   // Other values need to be implemented if we add them. The assertion
      //   // here will help remind us of that higher up in the call stack, since
      //   // this assertion would otherwise fire somewhere in the framework.
      //   assert(false, 'Need to implement ${settings.name}');
      //   return null;
      // },
      // title: 'Navigation with Arguments',
      // home: HomeScreen(),
      // routes: {
      //   ExtractArgumentsScreen.routeName: (context) =>
      //       ExtractArgumentsScreen(),
      //});
      //Ex5
      // title: 'Returning Data',
      // home: HomeScreenEx5(),
      title: 'Passing Data',
      home: TodosScreen(
        todos: List.generate(
          20,
          (i) => Todo(
            'Todo $i',
            'A description of what needs to be done for Todo $i',
          ),
        ),
      ),
    );
  }
}
