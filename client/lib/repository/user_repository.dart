import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:client/interfaces/user_repository_interface.dart';
import 'package:client/models/user_model.dart';

class UserRepository implements UserRepositoryInterface {
  final String baseUrl = 'http://localhost:8000/api/v1';

  @override
  Future<void> deleteUser(
      {required String id, required String accessToken}) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/user/$id'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    });
    if (response.statusCode != 204) {
      throw Exception('Failed to delete todo');
    }
  }

  @override
  Future<User> findUserByEmail({required String email}) async {
    final response =
        await http.get(Uri.parse('$baseUrl/user/$email'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to find todo by Email');
    }
  }

  @override
  Future<User> updateUser(
      {required String id,
      required User user,
      required String accessToken}) async {
    User updateUser = User(
        username: user.username,
        email: user.email,
        password: user.password,
        todos: user.todos != null ? user.todos : []);

    final response = await http.patch(
      Uri.parse('$baseUrl/user/${user.id}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(updateUser.toJson()),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update todo');
    }
  }
}
