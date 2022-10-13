import 'package:get/get.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';

class UsersController extends GetxController {
  final UserRepository _userRepository;
  final users = <User>[].obs;
  final currentUser = User.empty().obs;

  UsersController(this._userRepository);

  void fetchUserById(int userId) async {
    var userFromDb = await _userRepository.fetchUserById(userId);
    currentUser(userFromDb);
  }

  void fetchUsers() async {
    var usersFromDb = await _userRepository.fetchUsers();
    users(usersFromDb);
  }

  void saveUser(User user) async {
    _userRepository.saveUser(user);
    users.refresh();
    currentUser.refresh();
  }

  @override
  void onInit() {
    fetchUserById(0); // Load my profile
    fetchUsers();
    super.onInit();
  }
}
