import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class ProfileController extends GetxController {
  final UsersController _usersController;
  final Rx<User> user = User.user(uuid: '').obs;
  final String? _userUuid = Get.arguments;
  late final Worker _ever;

  ProfileController(this._usersController);

  @override
  void onInit() {
    super.onInit();
    if (_userUuid == null) {
      _fetchAdmin();
      _ever = ever(_usersController.adminUser, (_) => _fetchAdmin());
    } else {
      _fetchUser();
      _ever = ever(_usersController.users, (_) => _fetchUser());
    }
  }

  @override
  void onClose() {
    _ever.dispose();
    super.onClose();
  }

  void _fetchUser() {
    var newUser = _usersController.fetchUser(_userUuid ?? '');
    user(newUser);
    print('fetch profile(USER) with uuid = ${user().uuid}');
  }

  void _fetchAdmin() {
    user(_usersController.adminUser());
    print('fetch profile(ADMIN) with uuid = ${user().uuid}');
  }
}
