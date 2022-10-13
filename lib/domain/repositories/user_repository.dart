import '../models/user.dart';

abstract class UserRepository {
  Future<User> fetchUserById(int userId);

  Future<void> saveUser(User user);

  Future<List<User>> fetchUsers();
}
