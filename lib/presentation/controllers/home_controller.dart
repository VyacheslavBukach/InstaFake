import 'package:get/get.dart';

import '../../data/repositories/hive_user_repository.dart';
import '../widgets/post.dart';
import '../widgets/story.dart';

class HomeController extends GetxController {
  List<Story> stories = [];
  List<Post> posts = [];

  final _userRepository = Get.find<HiveUserRepository>();
}
