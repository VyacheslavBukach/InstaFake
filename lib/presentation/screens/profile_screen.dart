import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import './story_screen.dart';
import '../../utils/app_navigation.dart';
import '../controllers/profile_controller.dart';
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
  final _profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: Get.width * 0.4),
              child: Obx(
                () => Text(
                  _profileController.user().username,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Obx(
              () => _profileController.user().isVerified
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
                    avatar: _profileController.user().avatar,
                    hasStory: _profileController.user().storyList.isNotEmpty,
                    radius: 40,
                    onTap: () {
                      if (_profileController.user().storyList.isNotEmpty) {
                        Get.to(
                          StoryScreen(user: _profileController.user()),
                        );
                      }
                    },
                  ),
                ),
                Obx(
                  () => ProfileTopText(
                      title: 'posts', amount: _profileController.user().posts),
                ),
                Obx(
                  () => ProfileTopText(
                      title: 'followers',
                      amount: _profileController.user().followers),
                ),
                Obx(
                  () => ProfileTopText(
                      title: 'followings',
                      amount: _profileController.user().followings),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Obx(
              () => Text(
                _profileController.user().name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            Obx(
              () => Visibility(
                visible: _profileController.user().bio.isNotEmpty,
                child: Text(_profileController.user().bio),
              ),
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
                Get.toNamed(
                  AppRoutes.editProfile,
                  arguments: _profileController.user().uuid,
                );
              },
              child: Text(
                'edit_profile'.tr,
                style: Get.textTheme.titleMedium,
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
  ListTile(
    leading: const Icon(Icons.supervised_user_circle),
    title: Text('users_editor'.tr),
    onTap: () {
      Get.back();
      Get.toNamed(AppRoutes.userEditor);
    },
  ),
];
