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
  final TextEditingController nameTextEditingController =
      TextEditingController(); // TODO
  final TextEditingController userNameTextEditingController =
      TextEditingController();
  final TextEditingController postsTextEditingController =
      TextEditingController();
  final TextEditingController followersTextEditingController =
      TextEditingController();
  final TextEditingController bioTextEditingController =
      TextEditingController();
  final TextEditingController followingsTextEditingController =
      TextEditingController();
  final avatarPath = Rxn<File>();
  final isConfirmedProfile = false.obs;
  final String? userUuid = Get.arguments;
  final edittedUser = User.user(uuid: 'emptyUserKey').obs;

  EditProfileController(
    this._usersController,
    this._imagePicker,
  );

  Future<void> _setUser() async {
    if (userUuid != null) {
      var user = await _usersController.fetchUserByUuid(userUuid ?? '');
      edittedUser(user);
    }
  }

  Future<User> f() async {
    return await _usersController.fetchUserByUuid(userUuid ?? '');
  }

  bool currentUserHasStory() {
    // TODO
    return edittedUser().storyList.isNotEmpty;
  }

  void changeConfirmedStatus() {
    isConfirmedProfile(!isConfirmedProfile.value);
  }

  void saveProfile() async {
    var updatedUser = edittedUser()
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
    nameTextEditingController.text = edittedUser().name;
    userNameTextEditingController.text = edittedUser().username;
    postsTextEditingController.text = edittedUser().posts.toString();
    followersTextEditingController.text = edittedUser().followers.toString();
    followingsTextEditingController.text = edittedUser().followings.toString();
    bioTextEditingController.text = edittedUser().bio;
  }

  @override
  void onInit() async {
    super.onInit();
    await _setUser();
    _initTextEditingControllers();
    print('edit user with uuid = $userUuid');
    avatarPath(edittedUser().avatar);
    isConfirmedProfile(edittedUser().isVerified);
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
