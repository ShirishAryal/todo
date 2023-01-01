import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo/widgets/todo_list_view.dart';
import 'package:todo_repository/todo_repository.dart';

import '../bloc/todo_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(
        todoRepository: context.read<TodoRepository>(),
      )..add(const TodoSubscriptionRequested()),
      child: const TodosView(),
    );
  }
}

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TodoBloc, TodoState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == TodoStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                  content: Text('Error Occured'),
                ),
              );
          }
        },
        child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          if (state.todos.isEmpty) {
            if (state.status == TodoStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status != TodoStatus.success) {
              return const SizedBox();
            } else {
              return const Center(
                child: Text('You have not added any thing yet!!'),
              );
            }
          }
          return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) => TodoListTile(
                    todo: state.todos[index],
                    onToggleCompleted: (isCompleted) {
                      // context.read<TodoBloc>().add(
                      //       TodosOverviewTodoCompletionToggled(
                      //         todo: todo,
                      //         isCompleted: isCompleted,
                      //       ),
                      //     );
                    },
                    onDismissed: (_) {
                      // context
                      //     .read<TodosOverviewBloc>()
                      //     .add(TodosOverviewTodoDeleted(todo));
                    },
                    onTap: () {
                      // Navigator.of(context).push(
                      //   EditTodoPage.route(initialTodo: todo),
                      // );
                    },
                  ));
        }),
      ),
    );
  }
}
