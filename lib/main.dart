import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './screens/home_screen.dart';
import './utils/app_theme.dart';
import './utils/app_translation.dart';

void main() {
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
      home: const HomeScreen(),
    );
  }
}
