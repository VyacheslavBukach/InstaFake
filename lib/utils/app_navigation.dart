import 'package:get/get.dart';

import '../presentation/bindings/main_binding.dart';
import '../presentation/screens/edit_profile_screen.dart';
import '../presentation/screens/main_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const main = '/';
  // static const home = '/home';
  static const editProfile = '/edit-profile';
  // static const profile = '/profile';
}

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.home,
    //   page: () => const HomeScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.profile,
    //   page: () => const ProfileScreen(),
    //   binding: ProfileBinding(),
    // ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileScreen(),
      fullscreenDialog: true,
    ),
  ];
}
