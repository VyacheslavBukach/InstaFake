import 'package:get/get.dart';
import 'package:insta_fake/utils/user_type.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';

class UsersController extends GetxController with StateMixin {
  final UserRepository _userRepository;
  final users = <User>[].obs;
  final adminUser = User.admin(uuid: '').obs;
  final currentUser = User.user(uuid: '').obs;

  UsersController(this._userRepository);

  Future<void> _createAdminProfile() async {
    await _userRepository.createAdminProfile();
  }

  void _setAdmin() {
    var user = users().firstWhere((user) => user.userType == UserType.admin);
    adminUser(user);
  }

  void setCurrentUser(String userUuid) {
    var user = users().firstWhere((user) => user.uuid == userUuid);
    currentUser(user);
  }

  User createNewUserProfile() {
    return _userRepository.createNewUserProfile();
  }

  Future<void> _fetchUsers() async {
    var usersFromDb = await _userRepository.fetchAllUsers();
    users.assignAll(usersFromDb);
    _setAdmin();
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
    await _createAdminProfile();
    await _fetchUsers();
  }
}
