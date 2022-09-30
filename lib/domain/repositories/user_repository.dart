import '../models/user.dart';

abstract class UserRepository {
  Future<User> getUserById(String id);

  Future<void> saveUser(String id);

  Future<void> deleteUser(String id);
}
