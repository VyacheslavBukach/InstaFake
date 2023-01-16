import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';
import '../controllers/users_controller.dart';

class BottomBar extends GetView<NavigationController> {
  final _usersController = Get.find<UsersController>();

  BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
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
            icon: _usersController.users().isEmpty
                ? const CircularProgressIndicator()
                : CircleAvatar(
                    radius: 14,
                    backgroundColor: controller.pageIndex.value == 4
                        ? Colors.black
                        : Colors.white,
                    child: _usersController.adminUser().avatar != null
                        ? CircleAvatar(
                            radius: 12,
                            backgroundImage: FileImage(
                              _usersController.adminUser().avatar ?? File(''),
                            ),
                          )
                        : SvgPicture.asset(
                            'assets/empty_avatar.svg',
                            height: 24,
                            width: 24,
                          ),
                  ),
            label: '',
          ),
        ],
      ),
    );
  }
}
