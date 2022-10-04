import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/news_feed.dart';
import '../widgets/stories_feed.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: Column(
        children: [
          GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) => StoriesFeed(stories: controller.stories),
          ),
          GetBuilder<HomeController>(
            builder: (controller) => NewsFeed(posts: controller.posts),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
