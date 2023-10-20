class Todo {
  Todo({
    this.id,
    required this.title,
    required this.content,
    required this.completed,
  });

  final String? id;
  final String title;
  final String content;
  final bool completed;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'completed': completed,
    };
  }
}