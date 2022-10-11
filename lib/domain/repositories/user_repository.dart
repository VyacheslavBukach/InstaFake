import '../models/user.dart';

abstract class UserRepository {
  Future<User> getUserById(int id);

  Future<void> saveUser(User user);

  Future<List<User>> getUsers();
}
