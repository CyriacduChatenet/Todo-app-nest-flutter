class Todo {
  Todo({
    this.id,
    this.title,
    this.content,
    this.completed,
  });

  final String? id;
  final String? title;
  final String? content;
  final bool? completed;

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'content': content,
      'completed': completed,
    };
  }

  static Todo fromJson(Map<String, Object?> json) {
    return Todo(
      id: json['id'] as String?,
      title: json['title'] as String,
      content: json['content'] as String?,
      completed: json['completed'] as bool,
    );
  }
}
