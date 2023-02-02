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
  late final Worker _ever;

  VideoPickerController(
    this._usersController,
    this._imagePicker,
  );

  @override
  void onInit() {
    super.onInit();
    _fetchUser();
    _ever = ever(_usersController.users, (_) {
      _fetchUser();
      user.refresh();
    });
  }

  @override
  void onClose() {
    _ever.dispose();
    super.onClose();
  }

  void _fetchUser() {
    user(_usersController.fetchUser(_userUuid));
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
