import 'dart:developer';

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
      appBar: AppBar(
        title: const Text('My Tasks'),
        elevation: 0,
      ),
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
                      log(isCompleted.toString());
                      context.read<TodoBloc>().add(
                            TodoCompleted(
                              todo: state.todos[index],
                              completed: isCompleted,
                            ),
                          );
                    },
                    onDismissed: (_) {
                      // context
                      //     .read<TodosOverviewBloc>()
                      //     .add(TodosOverviewTodoDeleted(todo));
                    },
                    onTap: () {
                      log('Tap');
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
