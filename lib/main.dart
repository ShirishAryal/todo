import 'package:flutter/material.dart';
import 'package:local_storage/local_storage.dart';
import 'package:todo_repository/todo_repository.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final todoApi = LocalStorage(
    plugin: await SharedPreferences.getInstance(),
  );
  runApp(TodoApp(todoRepository: TodoRepository(todoApi)));
}
