import 'package:get/get.dart';
import 'package:insta_fake/presentation/controllers/profile_controller.dart';

import '../controllers/users_controller.dart';

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
