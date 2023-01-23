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
    if (adminUser().uuid == user.uuid) {
      _setAdmin();
    } else {
      users.removeWhere((element) => element.uuid == user.uuid);
      users.add(user);
    }
  }

  Future<void> deleteUser(String userUuid) async {
    await _userRepository.deleteUserByUuid(userUuid);
    users.removeWhere((element) => element.uuid == userUuid);
  }

  @override
  void onInit() async {
    super.onInit();
    await _fetchUsers();
  }
}
