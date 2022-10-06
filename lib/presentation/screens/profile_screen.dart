import 'package:flutter/material.dart';
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
        title: Text(controller.user.value.userName),
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
                const CircleAvatar(radius: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${controller.user.value.posts}'),
                    Text('posts'.tr),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${controller.user.value.followers}'),
                    Text('followers'.tr),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${controller.user.value.followings}'),
                    Text('followings'.tr),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(controller.user.value.name),
            Text(controller.user.value.bio),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade200,
                  onPrimary: Colors.black,
                  elevation: 0,
                  minimumSize: const Size.fromHeight(30)),
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
