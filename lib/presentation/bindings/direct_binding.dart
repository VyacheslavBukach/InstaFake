import 'package:get/get.dart';

import '../controllers/direct_controller.dart';
import '../controllers/users_controller.dart';

class DirectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DirectController>(
      () => DirectController(
        Get.find<UsersController>(),
      ),
    );
  }
}
