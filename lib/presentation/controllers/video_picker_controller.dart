import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class VideoPickerController extends GetxController {
  final UsersController _usersController;
  final ImagePicker _imagePicker;
  final user = User.user(uuid: '').obs;
  final _userUuid = Get.arguments;

  VideoPickerController(
    this._usersController,
    this._imagePicker,
  );

  @override
  void onInit() {
    super.onInit();
    user(_usersController.fetchUser(_userUuid));
    everAll([
      _usersController.adminUser,
      _usersController.users,
    ], (_) {
      user(_usersController.fetchUser(_userUuid));
      user.refresh();
    });
  }

  Future<void> takeVideoFromGallery() async {
    try {
      final videoFile =
          await _imagePicker.pickVideo(source: ImageSource.gallery);

      if (videoFile == null) {
        return;
      }

      final videoTemporary = videoFile.path;

      var updatedUser = user()..videoList.add(videoTemporary);
      _usersController.saveUser(updatedUser);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void deleteVideo(String videoPath) {
    var updatedUser = user()
      ..videoList.removeWhere((video) => video == videoPath);
    _usersController.saveUser(updatedUser);
  }
}
