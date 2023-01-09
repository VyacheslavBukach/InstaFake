import '../models/user.dart';

abstract class UserRepository {
  Future<void> createMyProfile();

  Future<User> fetchUserById(int userId);

  Future<void> saveUser(User user);

  Future<void> deleteUserById(int userId);

  Future<List<User>> fetchAllUsers();
}
