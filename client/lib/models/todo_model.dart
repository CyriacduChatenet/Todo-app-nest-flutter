class Todo {
  Todo({
    required this.id,
    required this.title,
    this.description,
    required this.completed,
  });

  final String id;
  late final String title;
  late final String? description;
  late final bool completed;

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completed': completed,
    };
  }

  Todo fromJson(Map<String, Object?> json) {
    return Todo(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      completed: json['completed'] as bool,
    );
  }
}
