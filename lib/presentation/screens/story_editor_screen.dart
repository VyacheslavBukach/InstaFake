import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/story_editor_controller.dart';
import '../widgets/avatar_widget.dart';

class StoryEditorScreen extends GetView<StoryEditorController> {
  const StoryEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('story_editor'.tr),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.usersController.users().length,
          itemBuilder: (ctx, listIndex) => ExpansionTile(
            leading: AvatarWidget(
              user: controller.usersController.users()[listIndex],
              radius: 20,
            ),
            title: Text(controller.usersController.users()[listIndex].username),
            subtitle: Text(
              '${controller.usersController.users()[listIndex].storyList.length} stories added',
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
                                  controller.usersController.users()[listIndex],
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
              ...controller.usersController
                  .users()[listIndex]
                  .storyList
                  .map((storyPath) => ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: FileImage(File(storyPath)),
                        ),
                        title: Text('Today'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => controller.deleteStory(
                            controller.usersController.users()[listIndex],
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
