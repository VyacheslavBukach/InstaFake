import 'package:get/get.dart';
import 'package:insta_fake/utils/user_type.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';

class UsersController extends GetxController with StateMixin {
  final UserRepository _userRepository;
  final users = <User>[].obs;
  final adminUser = User.admin(uuid: 'emptyAdminKey').obs;

  UsersController(this._userRepository);

  Future<void> _createAdminProfile() async {
    await _userRepository.createAdminProfile();
  }

  void _setAdmin() {
    var user = users().firstWhere((user) => user.userType == UserType.admin);
    adminUser(user);
  }

  // User createNewUser() {
  //   return _userRepository.createNewUserProfile();
  // }

  Future<void> _fetchUsers() async {
    var usersFromDb = await _userRepository.fetchAllUsers();
    users.assignAll(usersFromDb);
  }

  Future<User> fetchUserByUuid(String uuid) async {
    return await _userRepository.fetchUserByUuid(uuid);
  }

  Future<void> saveUser(User user) async {
    await _userRepository.saveUser(user);
    await _fetchUsers();
  }

  @override
  void onInit() async {
    super.onInit();
    await _createAdminProfile();
    await _fetchUsers();
    _setAdmin();
  }
}
