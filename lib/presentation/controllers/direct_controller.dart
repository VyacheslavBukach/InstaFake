import 'package:get/get.dart';

import './users_controller.dart';
import '../../domain/models/user.dart';

class DirectController extends GetxController {
  final UsersController _usersController;
  late final RxList<User> users;
  final RxList<User> usersWithOnlineStatus = <User>[].obs;

  DirectController(this._usersController);

  @override
  void onInit() {
    super.onInit();
    users = _usersController.users;
    _setUsers();
    everAll([
      _usersController.adminUser,
      _usersController.users,
    ], (_) => _setUsers());
  }

  void _setUsers() {
    var usersWithStoriesList = [
      _usersController.adminUser(),
      ..._usersController.users.where((user) => user.isOnline).toList(),
    ];
    usersWithOnlineStatus(usersWithStoriesList);
  }

  String fetchAdminUsername() {
    return _usersController.adminUser().username;
  }
}
