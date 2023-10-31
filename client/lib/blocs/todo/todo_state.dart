import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final String title;
  final String? content;
  final bool completed;

  const TodoState({
    required this.title,
    this.content,
    required this.completed,
  });

  @override
  List<Object?> get props => [title, content, completed];

  TodoState copyWith({
    String? title,
    String? content,
    bool? completed,
  }) {
    return TodoState(
      title: title ?? this.title,
      content: content ?? this.content,
      completed: completed ?? this.completed,
    );
  }
}
