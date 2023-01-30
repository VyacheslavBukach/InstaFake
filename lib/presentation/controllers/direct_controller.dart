import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class DirectController extends GetxController {
  final UsersController _usersController;
  late final RxList<User> users;
  final RxList<User> usersWithOnlineStatus = <User>[].obs;
  late final Worker _everAll;

  DirectController(this._usersController);

  @override
  void onInit() {
    super.onInit();
    users = _usersController.users;
    _setUsers();
    _everAll = everAll([
      _usersController.adminUser,
      users,
    ], (_) => _setUsers());
  }

  @override
  void onClose() {
    _everAll.dispose();
    super.onClose();
  }

  void _setUsers() {
    var usersWithStoriesList = [
      _usersController.adminUser(),
      ...users.where((user) => user.isOnline).toList(),
    ];
    usersWithOnlineStatus(usersWithStoriesList);
  }

  String fetchAdminUsername() {
    return _usersController.adminUser().username;
  }
}
