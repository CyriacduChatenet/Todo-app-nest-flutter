import 'package:client/models/todo_model.dart';

abstract class TodoRepositoryInterface {
  Future<List<Todo>> findAllTodos();
  Future<Todo> findTodoById(String id);
  Future<Todo> createTodo(
      {required String accessToken,
      required Todo todo,
      required String userId});
  Future<Todo> updateTodo({required String accessToken, required Todo todo});
  Future<void> deleteTodo({required String accessToken, required String id});
}
