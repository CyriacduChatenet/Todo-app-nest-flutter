import 'package:client/models/user_model.dart';

class Todo {
  Todo({
    this.id,
    required this.title,
    this.content,
    required this.completed,
    this.user,
  });

  final String? id;
  final String title;
  final String? content;
  final bool completed;
  final User? user;

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'content': content,
      'completed': completed,
      'user': user?.toJson(),
    };
  }

  static Todo fromJson(Map<String, Object?> json) {
    return Todo(
      id: json['id'] as String?,
      title: json['title'] as String? ?? '',
      content: json['content'] as String?,
      completed: json['completed'] as bool? ?? false,
      // Convertir le JSON de l'utilisateur en objet User
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, Object?>)
          : null,
    );
  }

  Todo copyWith({
    String? id,
    String? title,
    String? content,
    bool? completed,
    User? user,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      completed: completed ?? this.completed,
      user: user ?? this.user,
    );
  }
}
