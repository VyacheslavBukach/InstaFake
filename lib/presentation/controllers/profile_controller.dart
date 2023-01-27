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
    _fetchUser();
    everAll([_usersController.adminUser, _usersController.users], (_) {
      _fetchUser();
    });
  }

  void _fetchUser() {
    if (_userUuid == null) {
      user(_usersController.adminUser());
      print('fetch profile(ADMIN) with uuid = ${user().uuid}');
    } else {
      var newUser = _usersController.fetchUser(_userUuid ?? '');
      user(newUser);
      print('fetch profile(USER) with uuid = ${user().uuid}');
    }
  }
}
