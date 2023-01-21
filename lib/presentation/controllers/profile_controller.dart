import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class ProfileController extends GetxController {
  final UsersController _usersController;
  final user = User.user(uuid: '').obs;
  final String? _userUuid = Get.arguments;

  ProfileController(this._usersController);

  @override
  void onInit() {
    super.onInit();
    fetchUser();
    everAll([
      _usersController.adminUser,
      _usersController.users,
    ], (_) {
      fetchUser();
    });
  }

  fetchUser() {
    if (_userUuid == null) {
      user(_usersController.adminUser());
      print('open admin profile with uuid = ${user().uuid}');
    } else {
      user(_usersController.fetchUser(_userUuid ?? ''));
      print('open user profile with uuid = ${user().uuid}');
    }
  }
}
