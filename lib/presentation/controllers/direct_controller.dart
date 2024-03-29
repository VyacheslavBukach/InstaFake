import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';
import '../../utils/app_navigation.dart';

class DirectController extends GetxController {
  final UsersController _usersController;
  final RxList<User> users = <User>[].obs;
  final RxList<User> usersWithOnlineStatus = <User>[].obs;
  late final Worker _everAll;

  DirectController(this._usersController);

  @override
  void onInit() {
    super.onInit();
    _setUsers();
    _everAll = everAll([
      _usersController.adminUser,
      _usersController.users,
    ], (_) => _setUsers());
  }

  @override
  void onClose() {
    _everAll.dispose();
    super.onClose();
  }

  void _setUsers() {
    users(_usersController.users);
    var usersWithStoriesList = [
      _usersController.adminUser(),
      ...users.where((user) => user.isOnline).toList(),
    ];
    usersWithOnlineStatus(usersWithStoriesList);
  }

  String fetchAdminUsername() {
    return _usersController.adminUser().username;
  }

  void openDialogueWithUser(int index) {
    Get.toNamed(
      AppRoutes.dialogue,
      arguments: users[index].uuid,
    );
  }

  void openUserProfile(int index) {
    Get.toNamed(
      AppRoutes.profile,
      arguments: usersWithOnlineStatus[index].uuid,
    );
  }
}
