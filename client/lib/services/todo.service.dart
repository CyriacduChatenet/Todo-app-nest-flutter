import 'dart:convert';

import 'package:client/interfaces/todo.interface.dart';
import 'package:client/repository/todo.repository.dart';
import '../models/todo.dart';

class TodoService implements TodoInterface {
  final todoRepository = TodoRepository();

  @override
  Future<List<Todo>> getTodos() async {
    return [
      Todo(
        id: '1',
        title: 'Todo 1',
        content: 'Todo 1 content',
        completed: false,
      ),
      Todo(
        id: '2',
        title: 'Todo 2',
        content: 'Todo 2 content',
        completed: false,
      ),
      Todo(
        id: '3',
        title: 'Todo 3',
        content: 'Todo 3 content',
        completed: false,
      ),
    ];
  }

  @override
  Future<Todo> getTodoById(String id) async {
    return Todo(
      id: '1',
      title: 'Todo 1',
      content: 'Todo 1 content',
      completed: false,
    );
  }

  @override
  Future<Todo> createTodo({
    required String title,
    required String content,
    required bool completed,
  }) async {
    final newTodo = Todo(
      title: 'Todo 1',
      content: 'Todo 1 content',
      completed: false,
    );

    final newTodoString = newTodo.toString();
    final newTodoJson = json.encode(newTodoString);
    print(newTodoJson);
    todoRepository.createTodo(newTodoJson);
    return newTodo;
  }

  @override
  Future<Todo> updateTodo({
    required String id,
    required String title,
    required String content,
    required bool completed,
  }) async {
    return Todo(
      id: '1',
      title: 'Todo 1',
      content: 'Todo 1 content',
      completed: false,
    );
  }

  @override
  Future<void> deleteTodoById(String id) async {
    return;
  }
}