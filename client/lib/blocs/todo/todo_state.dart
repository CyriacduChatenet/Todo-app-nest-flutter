import 'package:equatable/equatable.dart';
import 'package:client/models/todo_model.dart';

class TodoState extends Equatable {
  final List<Todo> todos; // Ajoutez une liste de Todos
  final String? title;
  final String? content;
  final bool completed;

  const TodoState({
    required this.todos, // Initialisez la liste de Todos
    this.title,
    this.content,
    required this.completed,
  });

  @override
  List<Object?> get props => [todos, title, content, completed];

  TodoState copyWith({
    List<Todo>? todos, // Mettez à jour la liste de Todos
    String? title,
    String? content,
    bool? completed,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      title: title ?? this.title,
      content: content ?? this.content,
      completed: completed ?? this.completed,
    );
  }
}

class LoadedTodoState extends TodoState {
  const LoadedTodoState({
    required List<Todo> todos,
    String? title,
    String? content,
    required bool completed,
  }) : super(
          todos: todos,
          title: title,
          content: content,
          completed: completed,
        );
}

class ErrorTodoState extends TodoState {
  final String errorMessage;

  ErrorTodoState({
    required this.errorMessage,
    required List<Todo> todos,
    String? title,
    String? content,
    required bool completed,
  }) : super(
          todos: todos,
          title: title,
          content: content,
          completed: completed,
        );

  @override
  List<Object?> get props => [errorMessage, todos, title, content, completed];
}
