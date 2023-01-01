// import 'package:equatable/equatable.dart';

// class Todo extends Equatable {
//   String? id;
//   String? task;
//   String? description;
//   bool? completed;

//   Todo({this.id, this.task, this.description, this.completed = false});

//   Todo.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     task = json['task'];
//     description = json['description'];
//     completed = json['completed'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['task'] = task;
//     data['description'] = description;
//     data['completed'] = completed;
//     return data;
//   }

//   Todo copyWith({
//     String? id,
//     String? task,
//     String? description,
//     bool? completed,
//   }) {
//     return Todo(
//       id: id ?? this.id,
//       task: task ?? this.task,
//       description: description ?? this.description,
//       completed: completed ?? this.completed,
//     );
//   }

//   @override
//   List<Object> get props => [id!, task!, description!, completed!];
// }

import 'dart:convert';

import 'package:equatable/equatable.dart';

Todo todoFromMap(String str) => Todo.fromMap(json.decode(str));

String todoToMap(Todo data) => json.encode(data.toMap());

class Todo extends Equatable {
  Todo({
    required this.id,
    required this.task,
    required this.description,
    this.completed = false,
  });

  String id;
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
      completed: completed ?? completed!,
    );
  }

  @override
  List<Object> get props => [id, task, description, completed];
}
