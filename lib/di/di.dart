import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/repositories/hive_user_repository.dart';
import '../domain/entities/user.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    // Repositories
    Get.put<HiveUserRepository>(
      HiveUserRepository(box: Hive.box<User>('users')),
      permanent: true,
    );
  }
}
