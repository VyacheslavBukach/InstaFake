import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/edit_profile_controller.dart';
import '../controllers/users_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(
        usersController: Get.find<UsersController>(),
        imagePicker: Get.find<ImagePicker>(),
      ),
    );
  }
}
