import 'package:flutter/material.dart';

import 'package:todo_repository/todo_repository.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    Key? key,
    required this.todo,
    this.onToggleCompleted,
    this.onDismissed,
    this.onTap,
  }) : super(key: key);

  final Todo todo;
  final ValueChanged<bool>? onToggleCompleted;
  final DismissDirectionCallback? onDismissed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final captionColor = theme.textTheme.caption?.color;

    return Dismissible(
      key: Key('todoListTile_dismissible_${todo.id}'),
      onDismissed: onDismissed,
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: theme.colorScheme.error,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(
          Icons.delete,
          color: Color(0xAAFFFFFF),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          todo.task!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: !todo.completed!
              ? null
              : TextStyle(
                  color: captionColor,
                  decoration: TextDecoration.lineThrough,
                ),
        ),
        subtitle: Text(todo.description!, maxLines: 1, overflow: TextOverflow.ellipsis),
        iconColor: Theme.of(context).primaryColor,
        leading: Checkbox(
          side: const BorderSide(width: 1),
          shape: const CircleBorder(side: BorderSide.none),
          value: todo.completed!,
          onChanged: onToggleCompleted == null ? null : (value) => onToggleCompleted!(value!),
        ),
        trailing: onTap == null ? null : const Icon(Icons.chevron_right),
      ),
    );
  }
}
