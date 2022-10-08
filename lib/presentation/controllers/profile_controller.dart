import 'package:get/get.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';

class ProfileController extends GetxController {
  final UserRepository userRepository;

  ProfileController({required this.userRepository});

  final user = User.empty().obs;
  final userId = 0.obs;

  @override
  void onInit() async {
    // If there is no id in args, we set user id to 0
    userId.value = Get.arguments ?? 0;
    var userFromDb = await userRepository.getUserById(userId.value);
    user(userFromDb); // Update user from DB
    super.onInit();
  }
}
