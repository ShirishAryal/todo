import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'json_map.dart';

part 'todo.g.dart';

class Todo extends Equatable {
  Todo({
    String? id,
    required this.task,
    this.description = '',
    this.completed = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null and should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String id;
  final String task;
  final String description;
  final bool completed;

  Todo copyWith({
    String? id,
    String? task,
    String? description,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }

  static Todo fromJson(JsonMap json) => _$TodoFromJson(json);
  JsonMap toJson() => _$TodoToJson(this);

  @override
  List<Object> get props => [id, task, description, completed];
}
