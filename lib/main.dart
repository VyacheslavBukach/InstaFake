import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './presentation/screens/edit_profile_screen.dart';
import './presentation/screens/home_screen.dart';
import './presentation/screens/main_screen.dart';
import './presentation/screens/profile_screen.dart';
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
      home: const MainScreen(),
      initialRoute: MainScreen.routeName,
      getPages: [
        GetPage(
          name: MainScreen.routeName,
          page: () => const MainScreen(),
        ),
        GetPage(
          name: HomeScreen.routeName,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: ProfileScreen.routeName,
          page: () => const ProfileScreen(),
        ),
        GetPage(
          name: EditProfileScreen.routeName,
          page: () => const EditProfileScreen(),
          fullscreenDialog: true,
        ),
      ],
    );
  }
}
