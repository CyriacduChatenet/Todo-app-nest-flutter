import 'package:client/models/user_model.dart';

abstract class UserRepositoryInterface {
  Future<List<User>> findAllUsers();
  Future<User> findUserByEmail({required String email});
  Future<User> updateUser(
      {required String id, required User user, required String accessToken});
  Future<void> deleteUser({required String id, required String accessToken});
}
