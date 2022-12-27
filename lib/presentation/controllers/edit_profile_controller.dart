import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import './users_controller.dart';

class EditProfileController extends GetxController {
  final UsersController _usersController;
  final ImagePicker _imagePicker;
  late TextEditingController nameTextEditingController;
  late TextEditingController userNameTextEditingController;
  late TextEditingController postsTextEditingController;
  late TextEditingController followersTextEditingController;
  late TextEditingController bioTextEditingController;
  late TextEditingController followingsTextEditingController;
  final avatarPath = Rxn<File>();
  final isConfirmedProfile = false.obs;

  EditProfileController(
    this._usersController,
    this._imagePicker,
  );

  bool currentUserHasStory() {
    return _usersController.currentUser().storyList.isNotEmpty;
  }

  void changeCheckedStatus() {
    isConfirmedProfile(!isConfirmedProfile.value);
  }

  void saveProfile() async {
    var updatedUser = _usersController.currentUser()
      ..posts = int.parse(postsTextEditingController.text)
      ..followers = int.parse(followersTextEditingController.text)
      ..followings = int.parse(followingsTextEditingController.text)
      ..name = nameTextEditingController.text
      ..username = userNameTextEditingController.text
      ..bio = bioTextEditingController.text
      ..isVerified = isConfirmedProfile.value
      ..avatar = avatarPath.value;

    _usersController.saveUser(updatedUser);
  }

  Future<void> pickImageFromGallery() async {
    try {
      final imageFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (imageFile == null) {
        return;
      }

      final imageTemporary = File(imageFile.path);

      avatarPath(imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void deleteImage() {
    avatarPath.value = null;
  }

  void _initTextEditingControllers() {
    nameTextEditingController = TextEditingController(
      text: _usersController.currentUser().name,
    );
    userNameTextEditingController = TextEditingController(
      text: _usersController.currentUser().username,
    );
    postsTextEditingController = TextEditingController(
      text: _usersController.currentUser().posts.toString(),
    );
    followersTextEditingController = TextEditingController(
      text: _usersController.currentUser().followers.toString(),
    );
    followingsTextEditingController = TextEditingController(
      text: _usersController.currentUser().followings.toString(),
    );
    bioTextEditingController = TextEditingController(
      text: _usersController.currentUser().bio,
    );
  }

  @override
  void onInit() {
    avatarPath(_usersController.currentUser().avatar);
    isConfirmedProfile(_usersController.currentUser().isVerified);
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
