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
      TextEditingController();
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
  final isProfileOnline = false.obs;

  final String? userUuid = Get.arguments;
  User edittedUser = User.user(uuid: '');

  EditProfileController(
    this._usersController,
    this._imagePicker,
  );

  void _setUser() {
    if (userUuid == null) {
      edittedUser = _usersController.createNewUserProfile();
    } else {
      edittedUser = _usersController.fetchUser(userUuid ?? '');
    }
    print('edit user with uuid = ${edittedUser.uuid}');
  }

  bool currentUserHasStory() {
    return edittedUser.storyList.isNotEmpty;
  }

  void saveProfile() {
    var updatedUser = User(
      uuid: edittedUser.uuid,
      userType: edittedUser.userType,
      posts: int.parse(postsTextEditingController.text),
      followers: int.parse(followersTextEditingController.text),
      followings: int.parse(followingsTextEditingController.text),
      name: nameTextEditingController.text,
      username: userNameTextEditingController.text,
      bio: bioTextEditingController.text,
      isVerified: isConfirmedProfile.value,
      avatar: avatarPath.value,
      storyList: edittedUser.storyList,
      isOnline: isProfileOnline.value,
    );

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
    nameTextEditingController.text = edittedUser.name;
    userNameTextEditingController.text = edittedUser.username;
    postsTextEditingController.text = edittedUser.posts.toString();
    followersTextEditingController.text = edittedUser.followers.toString();
    followingsTextEditingController.text = edittedUser.followings.toString();
    bioTextEditingController.text = edittedUser.bio;
  }

  @override
  void onInit() {
    super.onInit();
    _setUser();
    _initTextEditingControllers();
    avatarPath(edittedUser.avatar);
    isConfirmedProfile(edittedUser.isVerified);
    isProfileOnline(edittedUser.isOnline);
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
