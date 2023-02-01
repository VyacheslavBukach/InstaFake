import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoCallController extends GetxController {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  final isInit = false.obs;
  final videoPath = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    _initializePlayer();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.onClose();
  }

  Future<void> _initializePlayer() async {
    videoPlayerController = VideoPlayerController.file(File(videoPath));

    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      // aspectRatio: videoPlayerController.value.aspectRatio,
      // aspectRatio: 1 / 1,
      showOptions: false,
      // showControls: false,
    );

    await Future.delayed(
      const Duration(milliseconds: 500),
    ).then((_) {
      chewieController?.seekTo(Duration.zero);
      isInit.value = true;
    });
  }
}
