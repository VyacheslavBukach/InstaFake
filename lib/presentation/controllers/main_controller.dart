import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import './profile_controller.dart';

class MainController extends GetxController {
  final ProfileController profileController;

  MainController({required this.profileController});

  final pageIndex = 4.obs;

  late PageController pageController;

  void goToPage(int index) {
    pageIndex.value = index;
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: pageIndex.value);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
