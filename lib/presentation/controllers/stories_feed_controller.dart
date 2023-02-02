import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';
import '../../utils/app_navigation.dart';
import '../../utils/user_type.dart';
import '../screens/story_overview_screen.dart';

class StoriesFeedController extends GetxController {
  final UsersController _usersController;
  final usersWithStories = <User>[].obs;

  StoriesFeedController(this._usersController);

  @override
  void onInit() {
    super.onInit();
    _setUsersWithStories();
    everAll([
      _usersController.adminUser,
      _usersController.users,
    ], (_) {
      _setUsersWithStories();
    });
  }

  void _setUsersWithStories() {
    var usersWithStoriesList = [
      _usersController.adminUser(),
      ..._usersController.users
          .where((user) => user.storyList.isNotEmpty)
          .toList(),
    ];
    usersWithStories(usersWithStoriesList);
  }

  void clickOnStory(int index) {
    if (usersWithStories[index].userType == UserType.user) {
      openStoryOverview(index);
    } else {
      Get.toNamed(AppRoutes.storyPicker);
    }
  }

  void openStoryOverview(int index) {
    Get.to(
      StoryOverviewScreen(
        user: usersWithStories[index],
      ),
    );
  }
}
