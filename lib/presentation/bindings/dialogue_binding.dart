import 'package:get/get.dart';

import '../controllers/dialogue_controller.dart';
import '../controllers/users_controller.dart';

class DialogueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DialogueController(
        Get.find<UsersController>(),
      ),
    );
  }
}
