import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/direct_controller.dart';
import '../widgets/avatar_widget.dart';

class DirectScreen extends GetView<DirectController> {
  const DirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.fetchAdminUsername()),
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
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoSearchTextField(enabled: false),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Obx(
                () => SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemBuilder: (_, listIndex) {
                      return SizedBox(
                        // width: 120,
                        child: Row(
                          children: [
                            // SizedBox(width: 16),
                            SizedBox(
                              width: 38 * 2 + 10,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      AvatarWidget(
                                        onTap: () {
                                          controller.openUserProfile(listIndex);
                                        },
                                        avatar: controller
                                            .usersWithOnlineStatus[listIndex]
                                            .avatar,
                                        hasStory: controller
                                            .usersWithOnlineStatus[listIndex]
                                            .storyList
                                            .isNotEmpty,
                                        radius: 38,
                                      ),
                                      Visibility(
                                        visible: listIndex != 0,
                                        child: Positioned(
                                          right: 8,
                                          bottom: 6,
                                          child: SvgPicture.asset(
                                            'assets/online_icon.svg',
                                            height: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    controller
                                        .usersWithOnlineStatus[listIndex].name,
                                    style: Get.textTheme.labelMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      );
                    },
                    itemCount: controller.usersWithOnlineStatus().length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
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
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: AvatarWidget(
                    avatar: controller.users[i].avatar,
                    hasStory: controller.users[i].storyList.isNotEmpty,
                    radius: 20,
                  ),
                  title: Text(
                    controller.users[i].name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    'message',
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.photo_camera_outlined),
                  onTap: () {
                    controller.openDialogueWithUser(i);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
