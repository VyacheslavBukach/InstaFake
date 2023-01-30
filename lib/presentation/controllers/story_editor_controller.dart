import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class StoryEditorController extends GetxController {
  final UsersController _usersController;
  final ImagePicker _imagePicker;
  final users = <User>[].obs;

  StoryEditorController(
    this._usersController,
    this._imagePicker,
  );

  @override
  void onInit() {
    super.onInit();
    var usersWithAdmin = [
      _usersController.adminUser(),
      ..._usersController.users(),
    ];
    users(usersWithAdmin);
  }

  Future<void> takePhotoFromGallery(User user) async {
    try {
      final imageFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (imageFile == null) {
        return;
      }

      final imageTemporary = imageFile.path;
      var updatedUser = user..storyList.add(imageTemporary);
      _usersController.saveUser(updatedUser);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void deleteStory(User user, String storyPath) {
    var updatedUser = user
      ..storyList.removeWhere((story) => story == storyPath);
    _usersController.saveUser(updatedUser);
  }
}
