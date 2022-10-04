import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../data/entities/user_entity.dart';
import '../../data/repositories/hive_user_repository.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    // Repositories
    Get.put<HiveUserRepository>(
      HiveUserRepository(box: Hive.box<UserEntity>('users')),
      permanent: true,
    );
  }
}
