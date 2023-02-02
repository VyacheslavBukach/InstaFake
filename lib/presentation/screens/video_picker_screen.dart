import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/video_picker_controller.dart';

class VideoPickerScreen extends GetView<VideoPickerController> {
  const VideoPickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.user().username),
        actions: [
          IconButton(
            onPressed: () {
              controller.takeVideoFromGallery();
            },
            icon: const Icon(Icons.video_collection_outlined),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'videos'.tr,
              style: Get.textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.user().videoList.length,
                itemBuilder: (ctx, listIndex) => ListTile(
                  onTap: () {},
                  title: Text(
                    controller.user().videoList[listIndex],
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.deleteVideo(
                        controller.user().videoList[listIndex],
                      );
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
