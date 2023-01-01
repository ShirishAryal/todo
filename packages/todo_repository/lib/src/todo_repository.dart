import 'package:todo_api/todo_api.dart';

class TodoRepository {
  // TodoRepository({TodoApi? todoApi}): _todoApi = todoApi??TodoApi();
  final TodoApi _todoApi;
  TodoRepository(this._todoApi);

  Stream<List<Todo>> getTodos() => _todoApi.getTodos();
  Future<void> saveTodo(Todo todo) => _todoApi.saveTodo(todo);
  Future<void> deleteTodo(String id) => _todoApi.deleteTodo(id);
}
