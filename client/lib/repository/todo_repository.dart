import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:client/interfaces/todo_repository_interface.dart';
import 'package:client/models/todo_model.dart';

class TodoRepository extends TodoRepositoryInterface {
  final String baseUrl = 'http://localhost:8000/api/v1';

  @override
  Future<List<Todo>> findAllTodos() async {
    final response = await http.get(Uri.parse('$baseUrl/todo'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch todos');
    }
  }

  @override
  Future<Todo> findTodoById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/todo/$id'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to find todo by ID');
    }
  }

  @override
  Future<Todo> createTodo(
      {required Todo todo, required String accessToken}) async {
    Todo newTodo = Todo(
      title: todo.title,
      content: todo.content,
      completed: todo.completed,
    );

    final response = await http.post(
      Uri.parse('$baseUrl/todo'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(newTodo.toJson()),
    );
    if (response.statusCode == 201) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add todo');
    }
  }

  @override
  Future<Todo> updateTodo(
      {required Todo todo, required String accessToken}) async {
    Todo updateTodo = Todo(
      title: todo.title,
      content: todo.content,
      completed: todo.completed,
    );

    final response = await http.patch(
      Uri.parse('$baseUrl/todo/${todo.id}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(updateTodo.toJson()),
    );
    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update todo');
    }
  }

  @override
  Future<void> deleteTodo(
      {required String id, required String accessToken}) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/todo/$id'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    });
    if (response.statusCode != 204) {
      throw Exception('Failed to delete todo');
    }
  }
}
