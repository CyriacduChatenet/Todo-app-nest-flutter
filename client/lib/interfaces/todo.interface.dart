import 'package:client/models/todo.dart';

abstract class TodoInterface {
  Future<List<Todo>> getTodos();
  Future<Todo> getTodoById(String id);
  Future<Todo> createTodo({
    required String title,
    required String content,
    required bool completed,
  });
  Future<Todo> updateTodo({
    required String id,
    required String title,
    required String content,
    required bool completed,
  });
  Future<void> deleteTodoById(String id);
}