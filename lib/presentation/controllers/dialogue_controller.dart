import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class DialogueController extends GetxController {
  final UsersController _usersController;
  final String _userUuid = Get.arguments;
  User user = User.user(uuid: '');

  DialogueController(this._usersController);

  @override
  void onInit() {
    super.onInit();
    user = _usersController.fetchUser(_userUuid);
  }
}
