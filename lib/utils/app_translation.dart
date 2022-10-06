import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_name': 'InstaFake',
          'posts': 'Posts',
          'followers': 'Followers',
          'followings': 'Followings',
          'edit_profile': 'Edit profile',
        },
        'ru_RU': {
          'app_name': 'ИнстаФэйк',
          'posts': 'Публикации',
          'followers': 'Подписчики',
          'followings': 'Подписки',
          'edit_profile': 'Редактировать профиль',
        }
      };
}
