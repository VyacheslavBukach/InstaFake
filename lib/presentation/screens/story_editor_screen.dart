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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controller.usersController.fetchUsers();
            Get.back();
          },
        ),
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
                title: const Center(child: Text('Add a story')),
                onTap: () {
                  Get.defaultDialog(
                    title: 'Choose',
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
                                  children: const [
                                    Icon(Icons.camera),
                                    Text('Camera'),
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
                          icon: Icon(Icons.delete),
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
