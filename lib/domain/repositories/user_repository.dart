import '../models/user.dart';

abstract class UserRepository {
  Future<User> createOrFetchAdminProfile();

  User createNewUserProfile();

  Future<void> saveUser(User user);

  Future<void> deleteUserByUuid(String uuid);

  Future<List<User>> fetchAllUsersWithoutAdmin();
}
