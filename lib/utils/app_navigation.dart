import 'package:get/get.dart';

import '../presentation/bindings/direct_binding.dart';
import '../presentation/bindings/edit_profile_binding.dart';
import '../presentation/bindings/main_binding.dart';
import '../presentation/bindings/story_editor_binding.dart';
import '../presentation/screens/direct_screen.dart';
import '../presentation/screens/edit_profile_screen.dart';
import '../presentation/screens/main_screen.dart';
import '../presentation/screens/profile_screen.dart';
import '../presentation/screens/story_editor_screen.dart';
import '../presentation/screens/user_editor_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const main = '/';
  static const editProfile = '/edit-profile';
  static const storyEditor = '/story-editor';
  static const userEditor = '/user-editor';
  static const direct = '/direct';
  static const profile = '/profile';
}

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileScreen(),
      binding: EditProfileBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: AppRoutes.storyEditor,
      page: () => const StoryEditorScreen(),
      binding: StoryEditorBinding(),
    ),
    GetPage(
      name: AppRoutes.userEditor,
      page: () => const UserEditorScreen(),
    ),
    GetPage(
      name: AppRoutes.direct,
      page: () => const DirectScreen(),
      binding: DirectBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
    ),
  ];
}
