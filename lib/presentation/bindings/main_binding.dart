import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/entities/user_entity.dart';
import '../../data/mappers/user_mapper.dart';
import '../../data/repositories/hive_user_repository.dart';
import '../../domain/repositories/user_repository.dart';
import '../controllers/navigation_controller.dart';
import '../controllers/users_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NavigationController>(NavigationController());

    Get.lazyPut<ImagePicker>(
      () => ImagePicker(),
      fenix: true,
    );

    // Mappers
    Get.put<UserMapper>(UserMapper());

    // Repositories
    Get.put<UserRepository>(
      HiveUserRepository(
        Hive.box<UserEntity>('users'),
        Get.find<UserMapper>(),
      ),
    );

    // Controllers
    Get.put<UsersController>(
      UsersController(
        Get.find<UserRepository>(),
      ),
    );

    // Bottom Navigation Controllers
  }
}
