import 'package:get/get.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';

class UsersController extends GetxController {
  final UserRepository _userRepository;
  final users = <User>[].obs;

  UsersController(this._userRepository);

  void _createMyProfile() async {
    await _userRepository.createMyProfile();
  }

  void _fetchUsers() async {
    var usersFromDb = await _userRepository.fetchAllUsers();
    users(usersFromDb);
  }

  void saveUser(User user) async {
    await _userRepository.saveUser(user);
    _fetchUsers();
  }

  @override
  void onInit() {
    _createMyProfile();
    _fetchUsers();
    super.onInit();
  }
}
