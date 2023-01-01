part of 'todo_bloc.dart';

enum TodoStatus { initial, loading, success, failure }

@immutable
class TodoState extends Equatable {
  final TodoStatus status;
  final List<Todo> todos;
  const TodoState({this.status = TodoStatus.initial, this.todos = const []});

  TodoState copyWith({TodoStatus Function()? status, List<Todo> Function()? todos}) {
    return TodoState(
      status: status != null ? status() : this.status,
      todos: todos != null ? todos() : this.todos,
    );
  }

  @override
  List<Object?> get props => [status, todos];
}
