import '../models/user.dart';

abstract class UserRepository {
  Future<void> createAdminProfile();

  User createNewUserProfile();

  Future<void> saveUser(User user);

  Future<void> deleteUserByUuid(String uuid);

  Future<List<User>> fetchAllUsers();
}
