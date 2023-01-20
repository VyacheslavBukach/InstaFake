import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';
import '../../utils/user_type.dart';

class DirectController extends GetxController {
  final usersWithOnlineStatus = <User>[].obs;
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
      ...users
          .where((user) => user.isOnline && user.userType != UserType.admin)
          .toList(),
    ];
    usersWithOnlineStatus(usersWithStoriesList);
  }

  String fetchAdminUsername() {
    return _usersController.adminUser().username;
  }
}
