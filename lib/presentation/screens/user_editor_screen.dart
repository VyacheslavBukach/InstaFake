import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_navigation.dart';
import '../controllers/users_controller.dart';
import '../widgets/avatar_widget.dart';

class UserEditorScreen extends GetView<UsersController> {
  const UserEditorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('users'.tr),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.editProfile);
            },
            icon: const Icon(Icons.add_reaction_outlined),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.users().length,
          itemBuilder: (ctx, listIndex) => ListTile(
            onTap: () {
              Get.toNamed(
                AppRoutes.editProfile,
                arguments: controller.users()[listIndex].uuid,
              );
            },
            leading: AvatarWidget(
              avatar: controller.users()[listIndex].avatar,
              hasStory: controller.users()[listIndex].storyList.isNotEmpty,
              radius: 20,
            ),
            title: Text(controller.users()[listIndex].username),
            subtitle: Text(
              controller.users()[listIndex].name,
            ),
          ),
        ),
      ),
    );
  }
}
