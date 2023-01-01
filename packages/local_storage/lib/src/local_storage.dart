import 'package:rxdart/rxdart.dart';
import 'package:todo_api/todo_api.dart';

class LocalStorage extends TodoApi {
  List<Todo> _todoList = [];
  final _todoStreamController = BehaviorSubject<List<Todo>>.seeded(const []);

  @override
  Stream<List<Todo>> getTodos() {
    _todoStreamController.add(_todoList);
    return _todoStreamController.asBroadcastStream();
  }

  @override
  Future<void> deleteTodo(String id) async {
    final index = _todoList.indexWhere((element) => element.id == id);
    if (index == -1) {
      throw TodoNotFoundException();
    } else {
      _todoList.removeAt(index);
    }
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final index = _todoList.indexWhere((element) => element.id == todo.id);
    if (index >= 0) {
      _todoList[index] = todo;
    } else {
      _todoList.add(todo);
    }
  }
}
