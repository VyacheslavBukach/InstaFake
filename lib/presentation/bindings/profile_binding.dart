import 'package:get/get.dart';

import '../controllers/profile_controller.dart';
import '../controllers/users_controller.dart';

// TODO delete because exists
class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        Get.find<UsersController>(),
      ),
    );
  }
}
