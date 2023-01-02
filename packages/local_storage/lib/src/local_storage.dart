import 'dart:convert';
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api/todo_api.dart';

class LocalStorage extends TodoApi {
  final SharedPreferences _plugin;
  LocalStorage({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }
  static const kTodosCollectionKey = '__todos_collection_key__';

  // LocalStorage() {
  //   _init();
  // }
  // final List<Todo> _todoList = [
  //   Todo(
  //     task: 'complete todo application',
  //     description: 'Submit todo application next day',
  //   ),
  // ];

  final _todoStreamController = BehaviorSubject<List<Todo>>.seeded(const []);
  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) => _plugin.setString(key, value);

  void _init() {
    final todosJson = _getValue(kTodosCollectionKey);
    if (todosJson != null) {
      final todos = List<Map<dynamic, dynamic>>.from(
        json.decode(todosJson) as List,
      ).map((jsonMap) => Todo.fromJson(Map<String, dynamic>.from(jsonMap))).toList();
      _todoStreamController.add(todos);
    } else {
      _todoStreamController.add(const []);
    }

    // _todoStreamController.add(_todoList);
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
      _todoStreamController.add(todos);
      return _setValue(kTodosCollectionKey, json.encode(todos));
    }
    // _todoStreamController.add(todos);
    // _todoList.removeWhere((element) => element.id == id);
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    print('save todo called');
    final todos = [..._todoStreamController.value];
    final todoIndex = todos.indexWhere((t) => t.id == todo.id);
    if (todoIndex >= 0) {
      todos[todoIndex] = todo;
    } else {
      todos.add(todo);
    }

    _todoStreamController.add(todos);
    return _setValue(kTodosCollectionKey, json.encode(todos));
    // final todos = [..._todoStreamController.value];
    // final index = todos.indexWhere((element) => element.id == todo.id);
    // if (index >= 0) {
    //   todos[index] = todo;
    // } else {
    //   todos.add(todo);
    // }
    // _todoStreamController.add(todos);
    // return _setValue(kTodosCollectionKey, json.encode(todos));
  }
}
