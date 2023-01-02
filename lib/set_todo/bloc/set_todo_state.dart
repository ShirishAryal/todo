part of 'set_todo_bloc.dart';

enum SetTodoStatus { initial, loading, success, failure }

extension SetTodoStatusX on SetTodoStatus {
  bool get isLoadingOrSuccess => [
        SetTodoStatus.loading,
        SetTodoStatus.success,
      ].contains(this);
}

class SetTodoState extends Equatable {
  const SetTodoState({
    this.status = SetTodoStatus.initial,
    this.initialTodo,
    this.task = '',
    this.description = '',
  });

  final SetTodoStatus status;
  final Todo? initialTodo;
  final String task;
  final String description;
  bool get isNewTodo => initialTodo == null;

  SetTodoState copyWith({
    SetTodoStatus? status,
    Todo? initialTodo,
    String? task,
    String? description,
  }) {
    return SetTodoState(
      status: status ?? this.status,
      initialTodo: initialTodo ?? this.initialTodo,
      task: task ?? this.task,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [status, initialTodo, task, description];
}

class SetTodoInitial extends SetTodoState {}
