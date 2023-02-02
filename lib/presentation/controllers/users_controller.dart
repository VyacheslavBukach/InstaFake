import 'package:get/get.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../../utils/app_navigation.dart';
import '../../utils/user_type.dart';

class UsersController extends GetxController {
  final UserRepository _userRepository;
  final users = <User>[].obs;
  final adminUser = User.admin(uuid: '').obs;

  UsersController(this._userRepository);

  @override
  void onInit() async {
    super.onInit();
    await _fetchUsers();
  }

  Future<void> _setAdmin() async {
    var admin = await _userRepository.fetchAdminProfile();
    adminUser(admin);
  }

  User fetchUser(String userUuid) {
    if (adminUser().uuid == userUuid) {
      return adminUser();
    }

    return users.firstWhere((user) => user.uuid == userUuid);
  }

  User createNewUserModel() {
    return _userRepository.createNewUserModel();
  }

  Future<void> _fetchUsers() async {
    _setAdmin();
    var usersFromDb = await _userRepository.fetchAllUsersWithoutAdmin();
    users.assignAll(usersFromDb);
  }

  Future<void> saveUser(User user) async {
    await _userRepository.saveUser(user);

    var existingIndex =
        users.indexWhere((element) => element.uuid == user.uuid);
    if (user.userType == UserType.admin) {
      adminUser(user);
      adminUser.refresh();
    } else if (existingIndex != -1) {
      users[existingIndex] = user;
    } else {
      users.add(user);
    }
  }

  Future<void> deleteUser(String userUuid) async {
    await _userRepository.deleteUser(userUuid);
    users.removeWhere((element) => element.uuid == userUuid);
  }

  void openEditProfile({String? userUuid}) {
    Get.toNamed(
      AppRoutes.editProfile,
      arguments: userUuid,
    );
  }
}
