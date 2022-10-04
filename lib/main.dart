import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './data/entities/user_entity.dart';
import './utils/app_navigation.dart';
import './utils/app_theme.dart';
import './utils/app_translation.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<UserEntity>('users');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslation(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      title: 'app_name'.tr,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.main,
      getPages: AppPages.pages,
    );
  }
}
