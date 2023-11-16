import 'package:client/models/todo_model.dart';

class User {
  User({
    this.id,
    this.username,
    required this.email,
    required this.password,
    required this.todos,
  });

  final String? id;
  final String? username;
  final String email;
  final String password;
  final List<Todo> todos;

  Map<String, Object?> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'todos': todos.map((todo) => todo.toJson()).toList(),
    };
  }

  static User fromJson(Map<String, Object?> json) {
    return User(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      todos: (json['todos'] as List<Map<String, Object?>>?)
              ?.map((todoJson) => Todo.fromJson(todoJson))
              .toList() ??
          [],
    );
  }

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
    List<Todo>? todos,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      todos: todos ?? this.todos,
    );
  }
}
