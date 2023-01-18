import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class ProfileController extends GetxController {
  final UsersController _usersController;
  late final Rx<User> user;
  final String? _userUuid = Get.arguments;

  ProfileController(this._usersController);

  @override
  void onInit() {
    super.onInit();
    if (_userUuid == null) {
      user = _usersController.adminUser;
      print('open admin profile with uuid = ${user().uuid}');
    } else {
      _usersController.setCurrentUser(_userUuid ?? '');
      user = _usersController.currentUser;
      print('open user profile with uuid = ${user().uuid}');
    }
  }
}
