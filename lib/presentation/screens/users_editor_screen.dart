import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/users_controller.dart';
import '../widgets/avatar_widget.dart';

class UsersEditorScreen extends GetView<UsersController> {
  const UsersEditorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('users_editor'.tr),
        actions: [
          IconButton(
            onPressed: () => controller.openEditProfile(),
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
              onTap: () => controller.openEditProfile(
                  userUuid: controller.adminUser().uuid),
              leading: AvatarWidget(
                avatar: controller.adminUser().avatar,
                hasStory: controller.adminUser().storyList.isNotEmpty,
                radius: 20,
              ),
              title: Text(
                controller.adminUser().username,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                controller.adminUser().name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'users'.tr,
              style: Get.textTheme.bodyLarge,
            ),
          ),
          Obx(
            () => Expanded(
              child: controller.users().isEmpty
                  ? Center(
                      child: Text('no_users_added'.tr),
                    )
                  : ListView.builder(
                      itemCount: controller.users().length,
                      itemBuilder: (_, listIndex) => ListTile(
                        onTap: () => controller.openEditProfile(
                            userUuid: controller.users[listIndex].uuid),
                        leading: AvatarWidget(
                          avatar: controller.users[listIndex].avatar,
                          hasStory:
                              controller.users[listIndex].storyList.isNotEmpty,
                          radius: 20,
                        ),
                        title: Text(
                          controller.users[listIndex].username,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          controller.users[listIndex].name,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            controller
                                .deleteUser(controller.users[listIndex].uuid);
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
