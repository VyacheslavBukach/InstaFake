import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/story_picker_controller.dart';
import '../widgets/avatar_widget.dart';

class StoryPickerScreen extends GetView<StoryPickerController> {
  const StoryPickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('story_editor'.tr),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.users().length,
          itemBuilder: (_, listIndex) => ExpansionTile(
            leading: AvatarWidget(
              avatar: controller.users[listIndex].avatar,
              hasStory: controller.users[listIndex].storyList.isNotEmpty,
              radius: 20,
            ),
            title: Text(
              controller.users[listIndex].username,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${controller.users[listIndex].storyList.length} stories added',
            ),
            children: [
              ListTile(
                title: Center(child: Text('add_a_story'.tr)),
                onTap: () {
                  Get.defaultDialog(
                    title: 'choose_a_file'.tr,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox.fromSize(
                          size: const Size(80, 80),
                          child: ClipOval(
                            child: Material(
                              child: InkWell(
                                onTap: () => controller.takePhotoFromGallery(
                                  controller.users[listIndex],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.folder),
                                    Text('gallery'.tr),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ...controller.users[listIndex].storyList
                  .map((storyPath) => ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: FileImage(File(storyPath)),
                        ),
                        title: const Text('Today'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => controller.deleteStory(
                            controller.users[listIndex],
                            storyPath,
                          ),
                        ),
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
