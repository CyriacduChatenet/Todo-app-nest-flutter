import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:client/interfaces/todo_repository_interface.dart';
import 'package:client/models/todo_model.dart';

class TodoRepository extends TodoRepositoryInterface {
  final String baseUrl = 'http://localhost:8000/api/v1';

  @override
  Future<List<Todo>> findAllTodos() async {
    final response = await http.get(Uri.parse('$baseUrl/todo'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch todos');
    }
  }

  @override
  Future<Todo> findTodoById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/todo/$id'));

    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to find todo by ID');
    }
  }

  @override
  Future<Todo> createTodo(Todo todo) async {
    final response = await http.post(
      Uri.parse('$baseUrl/todo'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(todo.toJson()),
    );
    if (response.statusCode == 201) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add todo');
    }
  }

  @override
  Future<Todo> updateTodo(Todo todo) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/todo/${todo.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(todo.toJson()),
    );
    if (response.statusCode == 200) {
      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update todo');
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/todo/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete todo');
    }
  }
}
