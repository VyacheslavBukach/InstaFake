import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './home_screen.dart';
import './profile_screen.dart';
import '../controllers/navigation_controller.dart';
import '../widgets/bottom_bar.dart';

class MainScreen extends GetView<NavigationController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
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
