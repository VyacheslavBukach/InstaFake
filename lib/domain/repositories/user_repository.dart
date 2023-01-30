import '../models/user.dart';

abstract class UserRepository {
  Future<User> fetchAdminProfile();

  User createNewUserModel();

  Future<void> saveUser(User user);

  Future<void> deleteUser(String uuid);

  Future<List<User>> fetchAllUsersWithoutAdmin();
}
