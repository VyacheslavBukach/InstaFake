import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/story_editor_controller.dart';
import '../controllers/users_controller.dart';

class StoryEditorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StoryEditorController(
        usersController: Get.find<UsersController>(),
        imagePicker: Get.find<ImagePicker>(),
      ),
    );
  }
}
