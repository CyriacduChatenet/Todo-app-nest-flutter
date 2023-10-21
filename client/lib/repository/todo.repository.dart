import 'dart:convert';

import 'package:http/http.dart' as http;

class TodoRepository {
  Future<List<Map<String, dynamic>>> getTodos() async {
  final Uri url = Uri.parse('http://localhost:8000/api/v1/todo');
  final http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body);
    final List<Map<String, dynamic>> todos = [];

    for (var jsonData in jsonList) {
      if (jsonData is Map<String, dynamic>) {
        todos.add(jsonData);
      }
    }

    return todos;
  } else {
    throw Exception('Failed to get todos');
  }
}

  Future<Map<String, dynamic>> getTodoById(String id) async {
  final Uri url = Uri.parse('http://localhost:8000/api/v1/todo/$id');
  final http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    final dynamic json = jsonDecode(response.body);
    final Map<String, dynamic> todo = json;

    return todo;
  } else {
    throw Exception('Failed to get todos');
  }
}

  Future<Map<String, dynamic>> createTodo(Map<String, dynamic> todo) async {
    final Uri url = Uri.parse('http://localhost:8000/api/v1/todo');
    final http.Response response = await http.post(
      url,
      body: jsonEncode(todo),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonDecoded = jsonDecode(response.body);
      return jsonDecoded;
    } else {
      throw Exception('Failed to create todo');
    }
  }

  Future<Map<String, dynamic>> updateTodo(String id, Map<String, dynamic> todo) async {
    final Uri url = Uri.parse('http://localhost:8000/api/v1/todo/$id');
    final http.Response response = await http.patch(
      url,
      body: jsonEncode(todo),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonDecoded = jsonDecode(response.body);
      return jsonDecoded;
    } else {
      throw Exception('Failed to update todo');
    }
  }

  Future<void> deleteTodoById(String id) async {
    final Uri url = Uri.parse('http://localhost:8000/api/v1/todo/$id');
    final http.Response response = await http.delete(url);

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete todo');
    }
  }
}
