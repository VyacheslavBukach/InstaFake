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
    _fetchUser(_usersController.adminUser());
    ever(_usersController.adminUser, (admin) {
      _fetchUser(admin);
    });
    // TODO
    // ever(_usersController.users, (users) {
    //   var user =
    //       _usersController.users.firstWhere((user) => user.uuid == _userUuid);
    //   _fetchUser(user);
    // });
  }

  void _fetchUser(User newUser) {
    if (_userUuid == null) {
      user(newUser);
      print('fetch profile(ADMIN) with uuid = ${user().uuid}');
    }
    // else {
    //   user(newUser);
    //   print('fetch profile(USER) with uuid = ${user().uuid}');
    // }
  }
}
