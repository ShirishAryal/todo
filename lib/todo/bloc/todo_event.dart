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
