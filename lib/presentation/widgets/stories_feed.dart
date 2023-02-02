import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './avatar_widget.dart';
import '../controllers/stories_feed_controller.dart';

class StoriesFeed extends GetView<StoriesFeedController> {
  const StoriesFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 100,
        child: ListView.separated(
          itemCount: controller.usersWithStories.length,
          itemBuilder: (_, listIndex) {
            return SizedBox(
              width: 30 * 2 + 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (listIndex == 0)
                      ? AvatarWidget(
                          avatar: controller.usersWithStories[listIndex].avatar,
                          hasStory: controller
                              .usersWithStories[listIndex].storyList.isNotEmpty,
                          radius: 30,
                          onTap: () => controller.clickOnStory(listIndex),
                        )
                      : AvatarWidget(
                          avatar: controller.usersWithStories[listIndex].avatar,
                          hasStory: controller
                              .usersWithStories[listIndex].storyList.isNotEmpty,
                          radius: 30,
                          onTap: () => controller.openStoryOverview(listIndex),
                        ),
                  const SizedBox(height: 4),
                  Text(
                    controller.usersWithStories[listIndex].username,
                    style: Get.textTheme.labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (ctx, i) => const SizedBox(width: 10),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
    );
  }
}
