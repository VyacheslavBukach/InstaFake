import 'package:get/get.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';

class ProfileController extends GetxController {
  final UserRepository userRepository;

  ProfileController({required this.userRepository});

  final user = User.empty().obs;
  // User get user => _user.value;

  @override
  void onInit() async {
    var userFromDb = await userRepository.getUserById(0);
    user(userFromDb); // Update user from DB
    super.onInit();
  }
}
