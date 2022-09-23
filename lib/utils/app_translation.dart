import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_name': 'InstaFake',
        },
        'ru_RU': {
          'app_name': 'ИнстаФэйк',
        }
      };
}
