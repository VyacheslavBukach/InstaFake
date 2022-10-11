import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/edit_profile_controller.dart';
import '../controllers/profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ImagePicker(),
      fenix: true,
    );
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(
        profileController: Get.find<ProfileController>(),
        imagePicker: Get.find<ImagePicker>(),
      ),
    );
  }
}
