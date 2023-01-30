import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/story_editor_controller.dart';
import '../controllers/users_controller.dart';

class StoryEditorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StoryEditorController(
        Get.find<UsersController>(),
        Get.find<ImagePicker>(),
      ),
    );
  }
}
