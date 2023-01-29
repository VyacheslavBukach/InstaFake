import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class StoriesFeedController extends GetxController {
  final UsersController _usersController;
  final usersWithStories = <User>[].obs;

  StoriesFeedController(this._usersController);

  @override
  void onInit() {
    super.onInit();
    _setUsersWithStories(_usersController.users());
    ever(_usersController.users, (users) => _setUsersWithStories(users));
  }

  void _setUsersWithStories(List<User> users) {
    List<User> usersWithStoriesList = [
      _usersController.adminUser(),
      ...users.where((user) => user.storyList.isNotEmpty).toList(),
    ];
    usersWithStories(usersWithStoriesList);
  }
}
