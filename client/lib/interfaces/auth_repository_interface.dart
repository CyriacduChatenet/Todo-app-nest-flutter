import 'package:client/models/user_model.dart';

abstract class AuthRepositoryInterface {
  Future<String> signin({required String email, required String password});
  Future<User> signup(
      {required String username,
      required String email,
      required String password});
  Future<void> logout();
}
