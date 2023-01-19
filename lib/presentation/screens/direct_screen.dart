import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/users_controller.dart';
import '../widgets/avatar_widget.dart';

class DirectScreen extends GetView<UsersController> {
  const DirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.adminUser().username),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            const CupertinoSearchTextField(enabled: false),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  CircleAvatar(radius: 38),
                  CircleAvatar(radius: 38),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Messages',
                  style: Get.textTheme.bodyLarge,
                ),
                Text(
                  'Requests',
                  style: TextStyle(
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.users().length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: AvatarWidget(
                    avatar: controller.users()[i].avatar,
                    hasStory: controller.users()[i].storyList.isNotEmpty,
                    radius: 20,
                  ),
                  title: Text(controller.users()[i].name),
                  subtitle: Text('message'),
                  trailing: const Icon(Icons.photo_camera_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
