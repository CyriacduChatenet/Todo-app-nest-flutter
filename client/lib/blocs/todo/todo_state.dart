import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final String title;
  final String? description;
  final bool completed;

  const TodoState({
    required this.title,
    this.description,
    required this.completed,
  });

  @override
  List<Object?> get props => [title, description, completed];

  TodoState copyWith({
    String? title,
    String? description,
    bool? completed,
  }) {
    return TodoState(
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}
