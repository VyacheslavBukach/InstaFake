import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import './profile_controller.dart';
import '../../domain/models/user.dart';

class EditProfileController extends GetxController {
  final ProfileController profileController;
  final ImagePicker imagePicker;

  EditProfileController({
    required this.profileController,
    required this.imagePicker,
  });

  final _previousAvatarPath = Rxn<File>();

  late TextEditingController nameTextEditingController;
  late TextEditingController userNameTextEditingController;
  late TextEditingController postsTextEditingController;
  late TextEditingController followersTextEditingController;
  late TextEditingController bioTextEditingController;
  late TextEditingController followingsTextEditingController;

  void changeCheckedStatus() {
    profileController.user().isChecked = !profileController.user().isChecked;
    profileController.user.refresh();
  }

  void goToProfileWithoutSave() {
    profileController.user().avatar = _previousAvatarPath.value;
    profileController.user.refresh();
    Get.back();
  }

  void saveProfile() async {
    var updatedUser = User(
      id: profileController.user().id,
      posts: int.parse(postsTextEditingController.text),
      followers: int.parse(followersTextEditingController.text),
      followings: int.parse(followingsTextEditingController.text),
      name: nameTextEditingController.text,
      username: userNameTextEditingController.text,
      bio: bioTextEditingController.text,
      isChecked: profileController.user().isChecked,
      avatar: profileController.user().avatar,
    );
    profileController.userRepository.saveUser(updatedUser);
    profileController.user.value = updatedUser;
    profileController.user.refresh();
    Get.back();
  }

  Future<void> pickImageFromGallery() async {
    try {
      final imageFile =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (imageFile == null) {
        return;
      }

      final imageTemporary = File(imageFile.path);

      profileController.user().avatar = imageTemporary;
      profileController.user.refresh();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void _initTextEditingControllers() {
    nameTextEditingController = TextEditingController(
      text: profileController.user.value.name,
    );
    userNameTextEditingController = TextEditingController(
      text: profileController.user.value.username,
    );
    postsTextEditingController = TextEditingController(
      text: profileController.user.value.posts.toString(),
    );
    followersTextEditingController = TextEditingController(
      text: profileController.user.value.followers.toString(),
    );
    followingsTextEditingController = TextEditingController(
      text: profileController.user.value.followings.toString(),
    );
    bioTextEditingController = TextEditingController(
      text: profileController.user.value.bio,
    );
  }

  @override
  void onInit() {
    _previousAvatarPath.value = profileController.user().avatar;
    _initTextEditingControllers();
    super.onInit();
  }

  @override
  void onClose() {
    nameTextEditingController.dispose();
    userNameTextEditingController.dispose();
    postsTextEditingController.dispose();
    followersTextEditingController.dispose();
    bioTextEditingController.dispose();
    followingsTextEditingController.dispose();
    super.onClose();
  }
}
