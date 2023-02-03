import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class VideoPickerController extends GetxController {
  final UsersController _usersController;
  final ImagePicker _imagePicker;
  final Rx<User> user = User.user(uuid: '').obs;
  final String _userUuid = Get.arguments;

  VideoPickerController(
    this._usersController,
    this._imagePicker,
  );

  @override
  void onInit() {
    super.onInit();
    _fetchUser();
  }

  void _fetchUser() {
    user(_usersController.fetchUser(_userUuid));
  }

  Future<void> takeVideoFromGallery() async {
    try {
      final videoFile = await _imagePicker.pickVideo(
        source: ImageSource.gallery,
      );
      if (videoFile == null) {
        return;
      }
      final videoTemporary = videoFile.path;
      user.update((user) {
        user?.videoList.add(videoTemporary);
      });
      _usersController.saveUser(user());
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void deleteVideo(String videoPath) {
    user.update((user) {
      user?.videoList.removeWhere((video) => video == videoPath);
    });
    _usersController.saveUser(user());
  }
}
