import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';
import '../controllers/users_controller.dart';

class BottomBar extends StatelessWidget {
  final NavigationController navController = Get.find();
  final UsersController usersController = Get.find();

  BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        onTap: navController.goToPage,
        items: [
          BottomNavigationBarItem(
            icon: navController.pageIndex.value == 0
                ? const Icon(Icons.home)
                : const Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: navController.pageIndex.value == 1
                ? const Icon(Icons.search)
                : const Icon(Icons.search_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: navController.pageIndex.value == 2
                ? const Icon(Icons.add_box)
                : const Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: navController.pageIndex.value == 3
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: usersController.users().isEmpty
                ? const CircularProgressIndicator()
                : CircleAvatar(
                    radius: 14,
                    backgroundColor: navController.pageIndex.value == 4
                        ? Colors.black
                        : Colors.white,
                    child: usersController.users()[0].avatar != null
                        ? CircleAvatar(
                            radius: 12,
                            backgroundImage: FileImage(
                              usersController.users()[0].avatar ?? File(''),
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
