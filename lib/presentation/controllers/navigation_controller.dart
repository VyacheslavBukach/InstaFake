import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final pageIndex = 4.obs;
  late PageController pageController;

  void goToPage(int index) {
    pageIndex(index);
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    ever(pageIndex, (_) => print('Page changed to ${pageIndex.value}'));
    pageController = PageController(initialPage: pageIndex.value);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
