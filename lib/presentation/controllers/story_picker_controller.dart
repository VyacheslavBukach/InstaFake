import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class StoryPickerController extends GetxController {
  final UsersController _usersController;
  final ImagePicker _imagePicker;
  final users = <User>[].obs;

  StoryPickerController(
    this._usersController,
    this._imagePicker,
  );

  @override
  void onInit() {
    super.onInit();
    _fetchUsersWithStories();
  }

  void _fetchUsersWithStories() {
    var usersWithAdmin = [
      _usersController.adminUser(),
      ..._usersController.users(),
    ];
    users(usersWithAdmin);
  }

  Future<void> takePhotoFromGallery(String userUuid) async {
    Get.back(); // Close dialog
    try {
      final imageFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (imageFile == null) {
        return;
      }
      final imageTemporary = imageFile.path;
      var userIndex = users.indexWhere((user) => user.uuid == userUuid);
      var updatedUser = users[userIndex]..storyList.add(imageTemporary);
      users[userIndex] = updatedUser;
      _usersController.saveUser(updatedUser);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void deleteStory(String userUuid, String storyPath) {
    var userIndex = users.indexWhere((user) => user.uuid == userUuid);
    var updatedUser = users[userIndex]
      ..storyList.removeWhere((story) => story == storyPath);
    users[userIndex] = updatedUser;
    _usersController.saveUser(updatedUser);
  }
}
