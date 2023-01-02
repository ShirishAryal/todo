part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      id: json['id'] as String?,
      task: json['task'] as String,
      description: json['description'] as String? ?? '',
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'task': instance.task,
      'description': instance.description,
      'completed': instance.completed,
    };
