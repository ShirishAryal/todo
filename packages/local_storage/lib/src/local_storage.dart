import 'package:rxdart/rxdart.dart';
import 'package:todo_api/todo_api.dart';

class LocalStorage extends TodoApi {
  LocalStorage() {
    _init();
  }

  final List<Todo> _todoList = [
    Todo(
      task: 'complete todo application',
      description: 'Submit todo application next day',
    ),
    Todo(
      task: 'complete todo application',
      description: 'Submit todo application next day',
    ),
    Todo(
      task: 'complete todo application',
      description: 'Submit todo application next day',
      completed: true,
    ),
    Todo(
      task: 'complete todo application',
      description: 'Submit todo application next day',
    )
  ];
  final _todoStreamController = BehaviorSubject<List<Todo>>.seeded(const []);

  void _init() {
    _todoStreamController.add(_todoList);
  }

  @override
  Stream<List<Todo>> getTodos() {
    // _todoStreamController.add(_todoList);
    return _todoStreamController.asBroadcastStream();
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todos = [..._todoStreamController.value];
    final index = todos.indexWhere((element) => element.id == id);
    if (index == -1) {
      throw TodoNotFoundException();
    } else {
      todos.removeAt(index);
    }
    _todoStreamController.add(todos);
    _todoList.removeWhere((element) => element.id == id);
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final todos = [..._todoStreamController.value];
    final index = todos.indexWhere((element) => element.id == todo.id);
    if (index >= 0) {
      todos[index] = todo;
    } else {
      todos.add(todo);
    }
    _todoStreamController.add(todos);
  }
}
