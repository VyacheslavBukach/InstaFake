import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/story_picker_controller.dart';
import '../controllers/users_controller.dart';

class StoryPickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StoryPickerController(
        Get.find<UsersController>(),
        Get.find<ImagePicker>(),
      ),
    );
  }
}
