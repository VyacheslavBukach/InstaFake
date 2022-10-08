import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './profile_controller.dart';
import '../../domain/models/user.dart';

class EditProfileController extends GetxController {
  final ProfileController profileController;

  EditProfileController({
    required this.profileController,
  });

  final isChecked = false.obs;

  late TextEditingController nameTextEditingController;
  late TextEditingController userNameTextEditingController;
  late TextEditingController postsTextEditingController;
  late TextEditingController followersTextEditingController;
  late TextEditingController bioTextEditingController;
  late TextEditingController followingsTextEditingController;

  void changeCheckedStatus() {
    isChecked.value = !isChecked.value;
  }

  void saveProfile() async {
    var updatedUser = User(
      id: profileController.userId.value,
      posts: int.parse(postsTextEditingController.text),
      followers: int.parse(followersTextEditingController.text),
      followings: int.parse(followingsTextEditingController.text),
      name: nameTextEditingController.text,
      username: userNameTextEditingController.text,
      bio: bioTextEditingController.text,
      isChecked: isChecked.value,
      avatar: null,
    );
    profileController.user.value = updatedUser;
    profileController.userRepository.saveUser(updatedUser);
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
    var currentUser = profileController.user.value;
    isChecked.value = currentUser.isChecked;
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
