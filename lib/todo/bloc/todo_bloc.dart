import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(const TodoState()) {
    on<TodoSubscriptionRequested>(_onSubscriptionRequested);
    on<TodoDeleted>(_onTodoDeleted);
  }
  final TodoRepository _todoRepository;

  Future<void> _onSubscriptionRequested(
    TodoSubscriptionRequested event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(status: () => TodoStatus.loading));
    await emit.forEach<List<Todo>>(
      _todoRepository.getTodos(),
      onData: (todo) => state.copyWith(status: () => TodoStatus.success, todos: () => todo),
      onError: (_, __) => state.copyWith(
        status: () => TodoStatus.failure,
      ),
    );
  }

  Future<void> _onTodoDeleted(
    TodoDeleted event,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith());
    await _todoRepository.deleteTodo(event.todo.id!);
  }
}
