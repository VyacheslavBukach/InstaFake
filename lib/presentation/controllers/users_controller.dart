import 'package:get/get.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';

class UsersController extends GetxController {
  final UserRepository _userRepository;
  final users = <User>[].obs;
  final adminUser = User.admin(uuid: '').obs;

  UsersController(this._userRepository);

  Future<void> _setAdmin() async {
    var admin = await _userRepository.createOrFetchAdminProfile();
    adminUser(admin);
  }

  User fetchUser(String userUuid) {
    if (adminUser().uuid == userUuid) {
      return adminUser();
    }

    return users.firstWhere((user) => user.uuid == userUuid);
  }

  User createNewUserProfile() {
    return _userRepository.createNewUserProfile();
  }

  Future<void> _fetchUsers() async {
    _setAdmin();
    var usersFromDb = await _userRepository.fetchAllUsersWithoutAdmin();
    users.assignAll(usersFromDb);
  }

  Future<void> saveUser(User user) async {
    await _userRepository.saveUser(user);
    await _fetchUsers();
  }

  Future<void> deleteUser(String userUuid) async {
    await _userRepository.deleteUserByUuid(userUuid);
    await _fetchUsers();
  }

  @override
  void onInit() async {
    super.onInit();
    await _fetchUsers();
  }
}
