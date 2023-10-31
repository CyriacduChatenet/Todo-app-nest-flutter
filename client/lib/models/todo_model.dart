class Todo {
  Todo({
    this.id,
    this.title,
    this.description,
    this.completed,
  });

  final String? id;
  final String? title;
  final String? description;
  final bool? completed;

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completed': completed,
    };
  }

  static Todo fromJson(Map<String, Object?> json) {
    return Todo(
      id: json['id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      completed: json['completed'] as bool,
    );
  }
}
