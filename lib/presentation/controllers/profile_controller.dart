import 'package:get/get.dart';

import '../../data/repositories/hive_user_repository.dart';
import '../../domain/models/user.dart';

class ProfileController extends GetxController {
  final _user = User().obs;
  get user => _user.value;

  final _userRepository = Get.find<HiveUserRepository>();

  @override
  void onInit() async {
    var userFromDb = await _userRepository.getUserById(0);
    user(userFromDb); // Update user from DB
    super.onInit();
  }
}
