class Todo {
  String? id;
  String? task;
  String? description;
  bool? completed;

  Todo({this.id, this.task, this.description, this.completed = false});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    task = json['task'];
    description = json['description'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task'] = task;
    data['description'] = description;
    data['completed'] = completed;
    return data;
  }
}
