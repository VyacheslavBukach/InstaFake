import 'package:camera/camera.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/video_call_controller.dart';
import '../widgets/avatar_widget.dart';

class VideoCallScreen extends GetView<VideoCallController> {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: WillPopScope(
        onWillPop: () async {
          Get.back();
          return true;
        },
        child: Scaffold(
          body: Obx(
            () => Column(
              children: [
                ...!controller.isInitVideo.value
                    ? [_oneContainer()]
                    : _twoContainers(),
                Expanded(
                  child: Container(
                      // color: Colors.black,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _oneContainer() => SizedBox(
        width: Get.width,
        height: Get.width * 2,
        child: controller.isInitCamera.value
            ? FittedBox(
                fit: BoxFit.fitHeight,
                child: SizedBox(
                  width: Get.width,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CameraPreview(controller.cameraController),
                      // Positioned(
                      //   top: Get.mediaQuery.padding.top,
                      //   right: Get.mediaQuery.padding.top,
                      //   child: ElevatedButton.icon(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.phone_disabled_sharp),
                      //     label: Text(''),
                      //   ),
                      // ),
                      Column(
                        children: [
                          SizedBox(height: Get.height * 0.15),
                          AvatarWidget(
                            avatar: controller.user.avatar,
                            hasStory: controller.user.storyList.isNotEmpty,
                            radius: 40,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            controller.user.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Contacting...'.tr,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      );

  List<Widget> _twoContainers() => [
        SizedBox(
          height: Get.width,
          width: Get.width,
          child: Chewie(controller: controller.chewieController!),
        ),
        SizedBox(
          height: Get.width,
          width: Get.width,
          child: ClipRect(
            child: OverflowBox(
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: SizedBox(
                  width: Get.width,
                  child: CameraPreview(controller.cameraController),
                ),
              ),
            ),
          ),
        ),
      ];
}
