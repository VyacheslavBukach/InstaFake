import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class DialogueController extends GetxController {
  final UsersController _usersController;
  final String _userUuid = Get.arguments;
  final Rx<User> user = User.user(uuid: '').obs;

  DialogueController(this._usersController);

  @override
  void onInit() {
    super.onInit();
    user(_usersController.fetchUser(_userUuid));
  }
}
