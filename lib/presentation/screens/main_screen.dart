import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import './profile_screen.dart';
import '../controllers/main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

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
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: controller.goToPage,
          items: [
            BottomNavigationBarItem(
              icon: controller.pageIndex.value == 0
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: controller.pageIndex.value == 1
                  ? const Icon(Icons.search)
                  : const Icon(Icons.search_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: controller.pageIndex.value == 2
                  ? const Icon(Icons.add_box)
                  : const Icon(Icons.add_box_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: controller.pageIndex.value == 3
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_outline),
              label: '',
            ),
            BottomNavigationBarItem(
              // TODO make it easier
              icon: controller.profileController.user().avatar != null
                  ? CircleAvatar(
                      radius: 14,
                      backgroundColor: controller.pageIndex.value == 4
                          ? Colors.black
                          : Colors.white,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundImage: FileImage(
                          controller.profileController.user().avatar ??
                              File(''),
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 14,
                      backgroundColor: controller.pageIndex.value == 4
                          ? Colors.black
                          : Colors.white,
                      child: SvgPicture.asset(
                        'assets/empty_avatar.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
