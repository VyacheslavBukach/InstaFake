import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class StoryEditorController extends GetxController {
  final UsersController usersController;
  final ImagePicker imagePicker;

  StoryEditorController({
    required this.usersController,
    required this.imagePicker,
  });

  Future<void> takePhotoFromGallery(User user) async {
    Get.back(); // Close dialog
    try {
      final imageFile =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (imageFile == null) {
        return;
      }

      final imageTemporary = imageFile.path;
      var updatedUser = user..storyList.add(imageTemporary);
      usersController.saveUser(updatedUser);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void deleteStory(User user, String storyPath) {
    var updatedUser = user
      ..storyList.removeWhere((element) => element == storyPath);
    usersController.saveUser(updatedUser);
  }
}
