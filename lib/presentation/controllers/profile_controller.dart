import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class ProfileController extends GetxController {
  final UsersController _usersController;
  final user = User.user(uuid: 'emptyUserKey').obs;
  String? _userUuid = Get.arguments;

  ProfileController(this._usersController);

  @override
  void onInit() async {
    super.onInit();
    _userUuid ??= _usersController.adminUser().uuid;
    var userWithUuid = await _usersController.fetchUserByUuid(_userUuid ?? '');
    user(userWithUuid);
    print('open profile with uuid=$_userUuid');
  }
}
