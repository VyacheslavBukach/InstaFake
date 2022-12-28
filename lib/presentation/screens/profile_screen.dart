import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import './story_screen.dart';
import '../../utils/app_navigation.dart';
import '../controllers/users_controller.dart';
import '../widgets/avatar_widget.dart';
import '../widgets/modal_bottom_sheet.dart';
import '../widgets/profile_top_text.dart';

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
                  : const SizedBox.shrink(),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                ModalBottomSheet(
                  title: 'create'.tr,
                  tiles: _userTiles,
                ),
              );
            },
            icon: const Icon(Icons.add_box_outlined),
          ),
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                ModalBottomSheet(
                  tiles: _menuTiles,
                ),
              );
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
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
                      if (usersController.currentUser().storyList.isNotEmpty) {
                        Get.to(
                          StoryScreen(user: usersController.currentUser()),
                        );
                      }
                    },
                  ),
                ),
                Obx(
                  () => ProfileTopText(
                      title: 'posts',
                      amount: usersController.currentUser().posts),
                ),
                Obx(
                  () => ProfileTopText(
                      title: 'followers',
                      amount: usersController.currentUser().followers),
                ),
                Obx(
                  () => ProfileTopText(
                      title: 'followings',
                      amount: usersController.currentUser().followings),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Obx(
              () => Text(
                usersController.currentUser().name,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            Obx(
              () => usersController.currentUser().bio.isNotEmpty
                  ? Text(usersController.currentUser().bio)
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(32),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.editProfile);
              },
              child: Text(
                'edit_profile'.tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

final _userTiles = [
  ListTile(
    leading: const Icon(Icons.movie_filter_outlined),
    title: Text('reel'.tr),
    onTap: null,
  ),
  ListTile(
    leading: const Icon(Icons.grid_on),
    title: Text('post'.tr),
    onTap: null,
  ),
  ListTile(
    leading: const Icon(Icons.history),
    title: Text('story'.tr),
    onTap: () {
      Get.back(); // Close bottomsheet
      Get.toNamed(AppRoutes.storyEditor);
    },
  ),
  ListTile(
    leading: const Icon(Icons.online_prediction),
    title: Text('live'.tr),
    onTap: null,
  ),
];

final _menuTiles = [
  ListTile(
    leading: const Icon(Icons.settings),
    title: Text('settings'.tr),
    onTap: null,
  ),
];
