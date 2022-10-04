import '../models/user.dart';

abstract class UserRepository {
  Future<User> getUserById(int id);

  Future<List<User>> getAllUsers();

  Future<void> saveUser(String id);

  Future<void> deleteUser(String id);
}
