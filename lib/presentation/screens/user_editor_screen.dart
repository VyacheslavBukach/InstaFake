import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_navigation.dart';
import '../../utils/user_type.dart';
import '../controllers/users_controller.dart';
import '../widgets/avatar_widget.dart';

class UserEditorScreen extends GetView<UsersController> {
  const UserEditorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('users_editor'.tr),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.editProfile);
            },
            icon: const Icon(Icons.add_reaction_outlined),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'my_profile'.tr,
              style: Get.textTheme.bodyLarge,
            ),
          ),
          Obx(
            () => ListTile(
              onTap: () {
                Get.toNamed(
                  AppRoutes.editProfile,
                  arguments: controller.adminUser().uuid,
                );
              },
              leading: AvatarWidget(
                avatar: controller.adminUser().avatar,
                hasStory: controller.adminUser().storyList.isNotEmpty,
                radius: 20,
              ),
              title: Text(controller.adminUser().username),
              subtitle: Text(
                controller.adminUser().name,
              ),
              trailing: controller.adminUser().userType == UserType.user
                  ? IconButton(
                      onPressed: () {
                        controller.deleteUser(controller.adminUser().uuid);
                      },
                      icon: const Icon(Icons.delete),
                    )
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'users'.tr,
              style: Get.textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: Obx(
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
                    hasStory:
                        controller.users()[listIndex].storyList.isNotEmpty,
                    radius: 20,
                  ),
                  title: Text(controller.users()[listIndex].username),
                  subtitle: Text(
                    controller.users()[listIndex].name,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.deleteUser(controller.users()[listIndex].uuid);
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
