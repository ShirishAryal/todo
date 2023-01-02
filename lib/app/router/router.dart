import 'package:flutter/material.dart';
import 'package:todo_repository/todo_repository.dart';

import '../../set_todo/view/set_todo_page.dart';
import '../../todo/view/home_page.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/settodo':
        Todo? _data = settings.arguments as Todo;
        return MaterialPageRoute(builder: (_) => SetTodoPage(_data));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
