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
  final int _index = Get.arguments ?? 0;

  EditProfileController(
    this._usersController,
    this._imagePicker,
  );

  bool currentUserHasStory() {
    return _usersController.users()[_index].storyList.isNotEmpty;
  }

  void changeCheckedStatus() {
    isConfirmedProfile(!isConfirmedProfile.value);
  }

  void saveProfile() async {
    var updatedUser = _usersController.users()[_index]
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
      text: _usersController.users()[_index].name,
    );
    userNameTextEditingController = TextEditingController(
      text: _usersController.users()[_index].username,
    );
    postsTextEditingController = TextEditingController(
      text: _usersController.users()[_index].posts.toString(),
    );
    followersTextEditingController = TextEditingController(
      text: _usersController.users()[_index].followers.toString(),
    );
    followingsTextEditingController = TextEditingController(
      text: _usersController.users()[_index].followings.toString(),
    );
    bioTextEditingController = TextEditingController(
      text: _usersController.users()[_index].bio,
    );
  }

  @override
  void onInit() {
    avatarPath(_usersController.users()[_index].avatar);
    isConfirmedProfile(_usersController.users()[_index].isVerified);
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
