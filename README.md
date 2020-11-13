# Flutter lab 4.1

A new Flutter application.

###### Structure of code

![](/screenshots/structure/Screenshot_12.png)

## 1. Animate a widget across screens

The direct link of this exercise: [Animate a widget across screens](https://flutter.dev/docs/cookbook/navigation/hero-animations)

###### main.dart
```dart
/// 1. Animate a widget across screens
import 'main_screen.dart';

void main() => runApp(HeroApp());

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',

      /// 1. Animate a widget across screens
      home: MainScreen(),
    );
  }
}
```

###### main_screen.dart
```dart
import 'package:flutter/material.dart';

import 'detail_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: GestureDetector(
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen();
          }));
        },
      ),
    );
  }
}
```

###### detail_screen.dart
```dart
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
```

###### Result


## 2. Navigate to a new screen and back

Code: [Exercise 2](https://github.com/sachgiaybut1102/-chapter4_x_report_1621050237_NgoCongMinh/tree/main/lib)

The direct link of this exercise: [Navigate to a new screen and back](https://flutter.dev/docs/cookbook/navigation/navigation-basics)

###### main.dart

```dart
import 'package:flutter/material.dart';
/// 2. Navigate to a new screen and back
import 'first_route.dart';

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',

      /// 2. Navigate to a new screen and back
      home: FirstRoute(),
    );
  }
}
```

###### first_route.dart

```dart
import 'package:flutter/material.dart';

import 'second_route.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

```
###### second_route.dart

```dart
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
```

###### Result


## 3. Navigate with named routes

Code: [Exercise 3](https://github.com/sachgiaybut1102/-chapter4_x_report_1621050237_NgoCongMinh/tree/main/lib)

The direct link of this exercise: [Navigate with named routes](https://flutter.dev/docs/cookbook/navigation/named-routes)

###### main.dart

```dart
/// 3. Navigate with named routes
import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',

      /// 3. Navigate with named routes (require restart app to run)
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}
```

###### first_screen.dart

```dart
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Launch screen'),
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}
```
###### second_screen.dart

```dart
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
```

###### Result



## 4. Pass arguments to a named route

Code:[Exercise 4](https://github.com/sachgiaybut1102/-chapter4_x_report_1621050237_NgoCongMinh/tree/main/lib)

The direct link of this exercise: [Pass arguments to a named route](https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments)

###### main.dart

```dart
/// 4 Pass arguments to a named route
import 'extract_arguments_screen.dart';
import 'home_screen_ex5.dart';
import 'pass_arguments_screen.dart';
import 'screen_arguments.dart';

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',

      /// 4 Pass arguments to a named route (require restart app to run)
      home: HomeScreen(),
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final ScreenArguments args = settings.arguments;

          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      routes: {
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
      },
    );
  }
}
```

###### screen_arguments.dart

```dart
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

```

###### home_screen.dart

```dart
import 'package:flutter/material.dart';
import 'extract_arguments_screen.dart';
import 'pass_arguments_screen.dart';
import 'screen_arguments.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: _generateNavigateButton(
                context,
                ExtractArgumentsScreen.routeName,
                'Go extracts screen',
                'Extract Screen',
                'This message is extracted in the build method.',
                Colors.green,
              ),
            ),
            _generateNavigateButton(
              context,
              PassArgumentsScreen.routeName,
              'Go pass screen',
              'Pass Screen',
              'This message is extracted in the onGenerateRoute function.',
              Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton _generateNavigateButton(BuildContext context, String route,
      String btnName, String appBarName, String message, Color color) {
    return ElevatedButton(
      child: Text(btnName),
      onPressed: () {
        Navigator.pushNamed(
          context,
          route,
          arguments: ScreenArguments(
            appBarName,
            message,
          ),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
    );
  }
}
```

###### pass_arguments_screen.dart

```dart
// A Widget that accepts the necessary arguments via the constructor.
import 'package:flutter/material.dart';

class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  // This Widget accepts the arguments as constructor parameters. It does not
  // extract the arguments from the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute function provided to the
  // MaterialApp widget.
  const PassArgumentsScreen({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
```

###### extract_arguments_screen.dart

```dart
// A Widget that extracts the necessary arguments from the ModalRoute.
import 'package:flutter/material.dart';

import 'screen_arguments.dart';

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}
```

###### Result



## 5. Return data from a screen

Code:[Exercise 5](https://github.com/sachgiaybut1102/-chapter4_x_report_1621050237_NgoCongMinh/tree/main/lib)

The direct link of this exercise: [Return data from a screen](https://flutter.dev/docs/cookbook/navigation/returning-data)

###### main.dart

```dart
/// 5. Return data from a screen
import 'home_screen_ex5.dart';

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',

      /// 5. Return data from a screen (require restart app to run)
      home: HomeScreenEx5(),
    );
  }
}
```

###### home_screen_ex5.dart

```dart
import 'package:flutter/material.dart';

import 'selection_button.dart';

class HomeScreenEx5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning Data Demo'),
      ),
      body: Center(child: SelectionButton()),
    );
  }
}

```

###### selection_button.dart

```dart
import 'package:flutter/material.dart';

import 'selection_screen.dart';

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Pick an option, any option!'),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

```

###### selection_screen.dart

```dart
import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Close the screen and return "Yep!" as the result.
                  Navigator.pop(context, 'Yep!');
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Close the screen and return "Nope!" as the result.
                  Navigator.pop(context, 'Nope.');
                },
                child: Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```

###### Result

![](/screenshots/exercise5/Screenshot_9.png)![](/screenshots/exercise5/Screenshot_10.png)


## 6. Send data to a new screen

Code:[Exercise 6](https://github.com/KaseaKyra/flutter_lab_4_1/tree/main/lib/ui/view/exercise6)

The direct link of this exercise: [Return data from a screen](https://flutter.dev/docs/cookbook/navigation/returning-data)

###### main.dart

```dart
/// 6. Send data to a new screen
import 'todo.dart';
import 'todos_screen.dart';

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',

      /// 6. Send data to a new screen
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
```

###### to_do_model.dart

```dart
class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}
```

###### to_dos_view.dart

```dart
import 'package:flutter/material.dart';

import 'detail_screen_ex6.dart';
import 'todo.dart';

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

```

###### detail_screen_ex6.dart

```dart
import 'package:flutter/material.dart';

import 'todo.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Todo todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}

```

###### Result
