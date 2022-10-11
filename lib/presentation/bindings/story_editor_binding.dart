import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/repositories/hive_user_repository.dart';
import '../controllers/story_editor_controller.dart';

class StoryEditorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StoryEditorController(
        userRepository: Get.find<HiveUserRepository>(),
        imagePicker: Get.find<ImagePicker>(),
      ),
    );
  }
}
