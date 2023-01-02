part of 'set_todo_bloc.dart';

abstract class SetTodoEvent extends Equatable {
  const SetTodoEvent();

  @override
  List<Object> get props => [];
}

class SetTodoTaskChanged extends SetTodoEvent {
  const SetTodoTaskChanged(this.task);

  final String task;

  @override
  List<Object> get props => [task];
}

class SetTodoDescriptionChanged extends SetTodoEvent {
  const SetTodoDescriptionChanged(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}

class SetTodoSubmitted extends SetTodoEvent {
  const SetTodoSubmitted();
}
