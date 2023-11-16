import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:client/interfaces/auth_repository_interface.dart';
import 'package:client/models/user_model.dart';
import 'package:client/models/auth/signin_model.dart';
import 'package:client/models/auth/signup_model.dart';

class AuthRepository implements AuthRepositoryInterface {
  final String baseUrl = 'http://localhost:8000/api/v1';

  @override
  Future<void> logout() {
    return const FlutterSecureStorage().delete(key: 'token');
  }

  @override
  Future<String> signin(
      {required String email, required String password}) async {
    Signin signin = Signin(email: email, password: password);

    final response = await http.post(
      Uri.parse('$baseUrl/auth/signin'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(signin.toJson()),
    );
    if (response.statusCode == 201) {
      final SigninResponse signinResponse =
          SigninResponse.fromJson(json.decode(response.body));
      const FlutterSecureStorage()
          .write(key: 'token', value: signinResponse.accessToken);
      return signinResponse.accessToken;
    } else {
      throw Exception('Failed to add user');
    }
  }

  @override
  Future<User> signup(
      {required String username,
      required String email,
      required String password}) async {
    Signup signup =
        Signup(email: email, username: username, password: password);

    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(signup.toJson()),
    );
    if (response.statusCode == 201) {
      final User user = User.fromJson(json.decode(response.body));
      return user;
    } else {
      throw Exception('Failed to add user');
    }
  }
}
