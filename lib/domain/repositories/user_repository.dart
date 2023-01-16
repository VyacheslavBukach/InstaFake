import '../models/user.dart';

abstract class UserRepository {
  Future<void> createAdminProfile();

  User createNewUserProfile();

  Future<User> fetchUserByUuid(String uuid);

  Future<void> saveUser(User user);

  Future<void> deleteUserByUuid(String uuid);

  Future<List<User>> fetchAllUsers();
}
