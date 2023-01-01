part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object> get props => [];
}

class TodoSubscriptionRequested extends TodoEvent {
  const TodoSubscriptionRequested();
}

class TodoDeleted extends TodoEvent {
  const TodoDeleted(this.todo);
  final Todo todo;

  @override
  List<Object> get props => [todo];
}

class TodoCompleted extends TodoEvent {
  const TodoCompleted({
    required this.todo,
    required this.completed,
  });

  final Todo todo;
  final bool completed;

  @override
  List<Object> get props => [todo, completed];
}
