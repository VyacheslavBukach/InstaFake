import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import '../controllers/users_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(
        Get.find<UsersController>(),
      ),
      tag: 'user',
    );
  }
}
