import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class VideoCallController extends GetxController {
  final UsersController _usersController;
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  late List<CameraDescription> _cameras;
  late CameraController cameraController;
  final String _userUuid = Get.arguments;
  User user = User.user(uuid: '');
  final isInitCamera = false.obs;
  final isInitVideo = false.obs;

  VideoCallController(this._usersController);

  @override
  void onInit() {
    super.onInit();
    _initUser();
    _initializeCamera();
    _initializePlayer();
  }

  @override
  void onClose() {
    cameraController.dispose();
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.onClose();
  }

  void _initUser() {
    user = _usersController.fetchUser(_userUuid);
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    cameraController = CameraController(_cameras[1], ResolutionPreset.veryHigh);
    try {
      await cameraController
          .initialize()
          .then((_) => isInitCamera.value = true);
    } on CameraException catch (e) {
      print('camera error $e');
    }
  }

  Future<void> _initializePlayer() async {
    videoPlayerController = VideoPlayerController.file(
      File(user.videoList.first),
    );
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      showOptions: false,
      // showControls: false,
    );

    await Future.delayed(
      const Duration(seconds: 5),
    ).then((_) {
      chewieController?.play();
      isInitVideo.value = true;
    });
  }
}
