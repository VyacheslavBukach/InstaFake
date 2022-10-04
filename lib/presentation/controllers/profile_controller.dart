import 'package:get/get.dart';

import '../../data/repositories/hive_user_repository.dart';
import '../../domain/models/user.dart';

class ProfileController extends GetxController {
  var user = User().obs;

  final _userRepository = Get.find<HiveUserRepository>();

  @override
  void onInit() async {
    var userFromDb = await _userRepository.getUserById(0);
    user(userFromDb); // Update user from DB
    super.onInit();
  }
}
