import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:insta_fake/data/repositories/hive_user_repository.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HiveUserRepository>(
      HiveUserRepository(box: Hive.box('users')),
      permanent: true,
    );
  }
}
