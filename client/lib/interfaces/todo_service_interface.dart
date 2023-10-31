import 'package:client/models/todo_model.dart';

abstract class TodoServiceInterface {
  Future<void> findAllTodos();
  Future<void> findTodoById(String id);
  Future<void> createTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(String id);
}
