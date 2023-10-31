import 'package:client/models/todo_model.dart';

abstract class TodoRepositoryInterface {
  Future<List<Todo>> findAllTodos();
  Future<Todo> findTodoById(String id);
  Future<Todo> createTodo(Todo todo);
  Future<Todo> updateTodo(Todo todo);
  Future<void> deleteTodo(String id);
}
