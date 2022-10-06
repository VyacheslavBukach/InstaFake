import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/entities/user_entity.dart';
import '../../data/mappers/user_mapper.dart';
import '../../data/repositories/hive_user_repository.dart';
import '../controllers/profile_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    // Mappers
    Get.put<UserMapper>(UserMapper());
    // Repositories
    Get.put<HiveUserRepository>(
      HiveUserRepository(
        box: Hive.box<UserEntity>('users'),
        userMapper: Get.find<UserMapper>(),
      ),
      permanent: true,
    );
    // Controller
    Get.lazyPut<ProfileController>(
      () => ProfileController(userRepository: Get.find<HiveUserRepository>()),
    );
  }
}
