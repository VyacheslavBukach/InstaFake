import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/users_controller.dart';
import '../controllers/video_picker_controller.dart';

class VideoPickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VideoPickerController(
        Get.find<UsersController>(),
        Get.find<ImagePicker>(),
      ),
    );
  }
}
