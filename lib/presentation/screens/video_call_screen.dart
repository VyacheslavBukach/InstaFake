import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/video_call_controller.dart';

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
          body: Column(
            children: [
              Obx(
                () => Container(
                  height: Get.width,
                  width: Get.width,
                  color: Colors.blue,
                  child: controller.isInit.value
                      ? Chewie(controller: controller.chewieController!)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text('Loading'),
                          ],
                        ),
                ),
              ),
              Container(
                height: Get.width,
                width: Get.width,
                color: Colors.yellow,
              ),
              Expanded(
                child: Container(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
