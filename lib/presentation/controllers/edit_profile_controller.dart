import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

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
  final int index = Get.arguments ?? -1;
  late User _currentUser;

  EditProfileController(
    this._usersController,
    this._imagePicker,
  );

  bool currentUserHasStory() {
    return _currentUser.storyList.isNotEmpty;
  }

  void changeCheckedStatus() {
    isConfirmedProfile(!isConfirmedProfile.value);
  }

  void saveProfile() async {
    var updatedUser = _currentUser
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
      text: _currentUser.name,
    );
    userNameTextEditingController = TextEditingController(
      text: _currentUser.username,
    );
    postsTextEditingController = TextEditingController(
      text: _currentUser.posts.toString(),
    );
    followersTextEditingController = TextEditingController(
      text: _currentUser.followers.toString(),
    );
    followingsTextEditingController = TextEditingController(
      text: _currentUser.followings.toString(),
    );
    bioTextEditingController = TextEditingController(
      text: _currentUser.bio,
    );
  }

  @override
  void onInit() {
    _currentUser =
        (index == -1) ? User.empty() : _usersController.users()[index];
    avatarPath(_currentUser.avatar);
    isConfirmedProfile(_currentUser.isVerified);
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
