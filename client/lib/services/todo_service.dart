import 'package:client/blocs/todo/todo_event.dart';
import 'package:client/interfaces/todo_service_interface.dart';
import 'package:client/models/todo_model.dart';
import 'package:client/repository/todo_repository.dart';
import 'package:client/blocs/todo/todo_bloc.dart';

class TodoService implements TodoServiceInterface {
  final TodoRepository _repository;
  final TodoBloc _bloc;

  TodoService(this._repository, this._bloc);

  @override
  Future<void> findAllTodos() async {
    try {
      final todos = await _repository.findAllTodos();
      _bloc.add(FindAllTodos()); // Émettre un événement LoadTodos
    } catch (e) {
      // Gérer l'erreur
    }
  }

  @override
  Future<void> findTodoById(String id) async {
    try {
      final todo = await _repository.findTodoById(id);
      if (todo != null) {
        _bloc.add(FindTodoById(id: id)); // Émettre un événement LoadTodos
      }
    } catch (e) {
      // Gérer l'erreur
    }
  }

  @override
  Future<void> createTodo(Todo todo) async {
    try {
      final addedTodo = await _repository.createTodo(todo);
      _bloc.add(AddTodo(todo: addedTodo)); // Émettre un événement AddTodo
    } catch (e) {
      // Gérer l'erreur
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    try {
      final updatedTodo = await _repository.updateTodo(todo);
      _bloc.add(
          UpdateTodo(todo: updatedTodo)); // Émettre un événement UpdateTodo
    } catch (e) {
      // Gérer l'erreur
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    try {
      await _repository.deleteTodo(id);
      _bloc.add(
          DeleteTodo(todo: Todo(id: id))); // Émettre un événement DeleteTodo
    } catch (e) {
      // Gérer l'erreur
    }
  }
}
