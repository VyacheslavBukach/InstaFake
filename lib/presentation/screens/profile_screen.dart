import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/app_navigation.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Obx(
              () => Text(controller.user().username),
            ),
            const SizedBox(width: 8),
            Obx(
              () => controller.user().isChecked
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    )
                  : const SizedBox(),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
                  () => controller.user().avatar != null
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage: Image.file(
                            controller.user().avatar ?? File(''),
                          ).image,
                        )
                      : SvgPicture.asset(
                          'assets/empty_avatar.svg',
                          height: 80,
                          width: 80,
                        ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text('${controller.user().posts}'),
                    ),
                    Text('posts'.tr),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text('${controller.user().followers}'),
                    ),
                    Text('followers'.tr),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text('${controller.user().followings}'),
                    ),
                    Text('followings'.tr),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Obx(
              () => Text(controller.user().name),
            ),
            Obx(
              () => Text(controller.user().bio),
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
