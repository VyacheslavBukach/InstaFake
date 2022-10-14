import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:insta_fake/presentation/screens/story_screen.dart';

import '../../utils/app_navigation.dart';
import '../controllers/users_controller.dart';
import '../widgets/avatar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  final usersController = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Obx(
              () => Text(usersController.currentUser().username),
            ),
            const SizedBox(width: 8),
            Obx(
              () => usersController.currentUser().isVerified
                  ? SvgPicture.asset(
                      'assets/verified_icon.svg',
                      width: 16,
                      height: 16,
                    )
                  : const SizedBox(),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            'create'.tr,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                      const Divider(),
                      // ListTile(
                      //   leading: const Icon(Icons.grid_4x4),
                      //   title: Text('post'.tr),
                      //   onTap: () {},
                      // ),
                      ListTile(
                        leading: const Icon(Icons.history),
                        title: Text('story'.tr),
                        onTap: () {
                          Get.back(); // Close bottomsheet
                          Get.toNamed(AppRoutes.storyEditor);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: const Icon(Icons.add_box_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(
                  () => AvatarWidget(
                    avatar: usersController.currentUser().avatar,
                    hasStory:
                        usersController.currentUser().storyList.isNotEmpty,
                    radius: 40,
                    onTap: () {
                      Get.to(StoryScreen(user: usersController.currentUser()));
                    },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text('${usersController.currentUser().posts}'),
                    ),
                    Text('posts'.tr),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text('${usersController.currentUser().followers}'),
                    ),
                    Text('followers'.tr),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text('${usersController.currentUser().followings}'),
                    ),
                    Text('followings'.tr),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Obx(
              () => Text(usersController.currentUser().name),
            ),
            Obx(
              () => Text(usersController.currentUser().bio),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade200,
                onPrimary: Colors.black,
                elevation: 0,
                minimumSize: const Size.fromHeight(30),
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.editProfile);
              },
              child: Text('edit_profile'.tr),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
