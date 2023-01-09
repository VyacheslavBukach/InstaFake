import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './profile_screen.dart';
import '../controllers/navigation_controller.dart';
import '../controllers/users_controller.dart';
import '../widgets/bottom_bar.dart';

class MainScreen extends GetView<NavigationController> {
  final usersController = Get.find<UsersController>();

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(),
          Container(),
          Container(),
          Container(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
