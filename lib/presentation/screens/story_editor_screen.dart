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
          itemCount: controller.users().length,
          itemBuilder: (ctx, listIndex) => ExpansionTile(
            leading: AvatarWidget(
              user: controller.users()[listIndex],
              radius: 30,
            ),
            title: Text(controller.users()[listIndex].username),
            subtitle: Text(
              '${controller.users()[listIndex].storyList.length} stories added',
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
                                    controller.users()[listIndex]),
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
              ...controller
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
                            controller.users()[listIndex],
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
