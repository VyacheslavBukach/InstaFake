import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';

class StoryEditorController extends GetxController {
  final UserRepository userRepository;
  final ImagePicker imagePicker;

  StoryEditorController({
    required this.userRepository,
    required this.imagePicker,
  });

  final users = <User>[].obs;

  Future<void> takePhotoFromGallery(User user) async {
    Get.back();
    try {
      final imageFile =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (imageFile == null) {
        return;
      }

      final imageTemporary = imageFile.path;

      var updatedUser = user..storyList.add(imageTemporary);

      userRepository.saveUser(updatedUser);
      _getUsers(); // change in other controller the same
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void deleteStory(User user, String storyPath) {
    var updatedUser = user
      ..storyList.removeWhere((element) => element == storyPath);
    userRepository.saveUser(updatedUser);
    _getUsers();
  }

  void _getUsers() async {
    users.value = await userRepository.getUsers();
  }

  @override
  void onInit() {
    _getUsers();
    super.onInit();
  }
}
