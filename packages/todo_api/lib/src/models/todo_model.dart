import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Todo todoFromMap(String str) => Todo.fromMap(json.decode(str));

String todoToMap(Todo data) => json.encode(data.toMap());

class Todo extends Equatable {
  Todo({
    String? id,
    required this.task,
    required this.description,
    this.completed = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  String? id;
  String task;
  String description;
  bool completed;

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
        id: json["id"],
        task: json["task"],
        description: json["description"],
        completed: json["completed"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "task": task,
        "description": description,
        "completed": completed,
      };

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      task: title ?? task,
      description: description ?? this.description,
      // completed: completed ?? completed!,
      completed: completed ?? false,
    );
  }

  @override
  List<Object?> get props => [id, task, description, completed];
}
