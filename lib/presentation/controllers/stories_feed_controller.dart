import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class StoriesFeedController extends GetxController {
  final usersWithStories = <User>[].obs;
  final _usersController = Get.find<UsersController>();

  @override
  void onInit() {
    _setUsers(_usersController.users());
    ever(_usersController.users, (users) {
      _setUsers(users);
    });
    super.onInit();
  }

  void _setUsers(List<User> users) {
    var usersWithStoriesList = [
      _usersController.adminUser(),
      ...users.where((user) => user.storyList.isNotEmpty).toList(),
    ];
    usersWithStories(usersWithStoriesList);
  }
}
