import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './avatar_widget.dart';
import '../../utils/app_navigation.dart';
import '../controllers/stories_feed_controller.dart';
import '../screens/story_screen.dart';

class StoriesFeed extends GetView<StoriesFeedController> {
  const StoriesFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 100,
        child: ListView.separated(
          itemCount: controller.usersWithStories.length,
          itemBuilder: (ctx, i) {
            return SizedBox(
              width: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (i == 0)
                      ? AvatarWidget(
                          avatar: controller.usersWithStories()[i].avatar,
                          hasStory: controller
                              .usersWithStories()[i]
                              .storyList
                              .isNotEmpty,
                          radius: 30,
                          onTap: () {
                            if (controller
                                .usersWithStories()[i]
                                .storyList
                                .isNotEmpty) {
                              Get.to(
                                StoryScreen(
                                  user: controller.usersWithStories()[i],
                                ),
                              );
                            } else {
                              Get.toNamed(AppRoutes.storyEditor);
                            }
                          },
                        )
                      : AvatarWidget(
                          avatar: controller.usersWithStories()[i].avatar,
                          hasStory: controller
                              .usersWithStories()[i]
                              .storyList
                              .isNotEmpty,
                          radius: 30,
                          onTap: () {
                            Get.to(
                              StoryScreen(
                                user: controller.usersWithStories()[i],
                              ),
                            );
                          },
                        ),
                  const SizedBox(height: 4),
                  Text(
                    controller.usersWithStories()[i].username,
                    style: Theme.of(context).textTheme.labelMedium,
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
