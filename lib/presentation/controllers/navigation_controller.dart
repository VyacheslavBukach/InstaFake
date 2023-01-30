import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final pageIndex = 0.obs;
  late final PageController pageController;

  void goToPage(int index) {
    pageIndex(index);
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: pageIndex.value);
    ever(pageIndex, (index) => print('Page changed to $index'));
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
