import 'package:get/get.dart';

import '../di/di.dart';
import '../presentation/screens/edit_profile_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/main_screen.dart';
import '../presentation/screens/profile_screen.dart';

class AppNavigation {
  static final pages = [
    GetPage(
      name: MainScreen.routeName,
      page: () => const MainScreen(),
      binding: MainBinding(),
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
  ];
}
