import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './presentation/screens/main_screen.dart';
import './utils/app_navigation.dart';
import './utils/app_theme.dart';
import './utils/app_translation.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('users');
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
      home: const MainScreen(),
      initialRoute: MainScreen.routeName,
      getPages: AppNavigation.pages,
    );
  }
}
