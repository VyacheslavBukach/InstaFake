import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_fake/utils/app_navigation.dart';

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
            onPressed: () {
              Get.toNamed(AppRoutes.direct);
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: Column(
        children: const [
          StoriesFeed(),
          Divider(),
          NewsFeed(posts: []),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
