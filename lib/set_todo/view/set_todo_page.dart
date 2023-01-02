import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_repository/todo_repository.dart';

import '../bloc/set_todo_bloc.dart';

class SetTodoPage extends StatelessWidget {
  SetTodoPage(this.initialTodo, {Key? key}) : super(key: key);
  Todo? initialTodo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SetTodoBloc(
              todoRepository: context.read<TodoRepository>(),
              initialTodo: initialTodo,
            ),
        child: BlocListener<SetTodoBloc, SetTodoState>(
          listenWhen: (previous, current) => previous.status != current.status && current.status == SetTodoStatus.success,
          listener: (context, state) => Navigator.of(context).pop(),
          child: const EditTodoView(),
        ));
  }
}

class EditTodoView extends StatelessWidget {
  const EditTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.select((SetTodoBloc bloc) => bloc.state.status);
    final isNewTodo = context.select(
      (SetTodoBloc bloc) => bloc.state.isNewTodo,
    );
    final theme = Theme.of(context);
    final floatingActionButtonTheme = theme.floatingActionButtonTheme;
    final fabBackgroundColor = floatingActionButtonTheme.backgroundColor ?? theme.colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(isNewTodo ? 'Add Todo' : 'Edit Todo'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width / 2,
        child: FloatingActionButton(
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
          backgroundColor: status.isLoadingOrSuccess ? fabBackgroundColor.withOpacity(0.5) : fabBackgroundColor,
          onPressed: status.isLoadingOrSuccess ? null : () => context.read<SetTodoBloc>().add(const SetTodoSubmitted()),
          child: status.isLoadingOrSuccess ? const CircularProgressIndicator() : const Icon(Icons.check_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [_TitleField(), _DescriptionField()],
          ),
        ),
      ),
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SetTodoBloc>().state;
    final hintText = state.initialTodo?.task ?? '';

    return TextFormField(
      key: const Key('editTodoView_title_textFormField'),
      initialValue: state.task,
      decoration: InputDecoration(
        enabled: !state.status.isLoadingOrSuccess,
        labelText: 'Task',
        hintText: hintText,
      ),
      maxLength: 50,
      onChanged: (value) {
        context.read<SetTodoBloc>().add(SetTodoTaskChanged(value));
      },
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SetTodoBloc>().state;
    final hintText = state.initialTodo?.description ?? '';

    return TextFormField(
      key: const Key('editTodoView_description_textFormField'),
      initialValue: state.description,
      decoration: InputDecoration(
        enabled: !state.status.isLoadingOrSuccess,
        hintText: hintText,
      ),
      maxLength: 100,
      maxLines: 7,
      onChanged: (value) {
        context.read<SetTodoBloc>().add(SetTodoDescriptionChanged(value));
      },
    );
  }
}
