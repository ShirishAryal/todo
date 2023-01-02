import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_repository/todo_repository.dart';

part 'set_todo_event.dart';
part 'set_todo_state.dart';

class SetTodoBloc extends Bloc<SetTodoEvent, SetTodoState> {
  final TodoRepository _todoRepository;
  SetTodoBloc({
    required TodoRepository todoRepository,
    required Todo? initialTodo,
  })  : _todoRepository = todoRepository,
        super(
          SetTodoState(
            initialTodo: initialTodo,
            task: initialTodo?.task ?? '',
            description: initialTodo?.description ?? '',
          ),
        ) {
    on<SetTodoTaskChanged>(_onTaskChanged);
    on<SetTodoDescriptionChanged>(_onDescriptionChanged);
    on<SetTodoSubmitted>(_onSubmitted);
  }

  void _onTaskChanged(
    SetTodoTaskChanged event,
    Emitter<SetTodoState> emit,
  ) {
    emit(state.copyWith(task: event.task));
  }

  void _onDescriptionChanged(
    SetTodoDescriptionChanged event,
    Emitter<SetTodoState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  Future<void> _onSubmitted(
    SetTodoSubmitted event,
    Emitter<SetTodoState> emit,
  ) async {
    emit(state.copyWith(status: SetTodoStatus.loading));
    final todo = (state.initialTodo ?? Todo(task: '', description: '')).copyWith(
      task: state.task,
      description: state.description,
    );

    try {
      await _todoRepository.saveTodo(todo);
      emit(state.copyWith(status: SetTodoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SetTodoStatus.failure));
    }
  }
}
