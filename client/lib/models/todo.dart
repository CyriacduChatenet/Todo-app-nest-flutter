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

  @override
  String toString() {
    return 'Todo{title: $title, content: $content, completed: $completed}';
  }
}