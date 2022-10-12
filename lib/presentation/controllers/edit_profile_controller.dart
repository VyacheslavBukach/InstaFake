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

  final avatarPath = Rxn<File>();
  final isConfirmedProfile = false.obs;

  late TextEditingController nameTextEditingController;
  late TextEditingController userNameTextEditingController;
  late TextEditingController postsTextEditingController;
  late TextEditingController followersTextEditingController;
  late TextEditingController bioTextEditingController;
  late TextEditingController followingsTextEditingController;

  void changeCheckedStatus() {
    isConfirmedProfile.value = !isConfirmedProfile.value;
  }

  void closeEditingProfile() {
    Get.back();
  }

  void saveProfileAndBack() async {
    var updatedUser = User(
      id: profileController.user().id,
      posts: int.parse(postsTextEditingController.text),
      followers: int.parse(followersTextEditingController.text),
      followings: int.parse(followingsTextEditingController.text),
      name: nameTextEditingController.text,
      username: userNameTextEditingController.text,
      bio: bioTextEditingController.text,
      isVerified: isConfirmedProfile.value,
      avatar: avatarPath.value,
      storyList: profileController.user().storyList,
    );
    profileController.userRepository.saveUser(updatedUser);
    profileController.user.value = updatedUser;
    profileController.user.refresh(); // TODO
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

      avatarPath.value = imageTemporary;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void deleteImage() {
    avatarPath.value = null;
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
    avatarPath.value = profileController.user().avatar;
    isConfirmedProfile.value = profileController.user().isVerified;
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
