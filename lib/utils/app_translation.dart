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
          'change_profile_photo': 'Change profile photo',
          'name': 'Name',
          'username': 'Username',
          'bio': 'Bio',
          'verified': 'Verified',
          'verified_desc': 'Set account to verified',
        },
        'ru_RU': {
          'app_name': 'ИнстаФэйк',
          'posts': 'Публикации',
          'followers': 'Подписчики',
          'followings': 'Подписки',
          'edit_profile': 'Редактировать профиль',
          'change_profile_photo': 'Изменить фото профиля',
          'name': 'Имя',
          'username': 'Имя пользователя',
          'bio': 'Био',
          'verified': 'Подтвержден',
          'verified_desc': 'Устанавливает аккаунт как подтвержденный',
        }
      };
}
