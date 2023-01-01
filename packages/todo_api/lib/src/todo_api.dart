import 'package:todo_api/todo_api.dart';

abstract class TodoApi {
  Future<void> saveTodo(Todo todo);
  Future<void> deleteTodo(String id);
  Stream<List<Todo>> getTodos();
}

class TodoNotFoundException implements Exception {}
