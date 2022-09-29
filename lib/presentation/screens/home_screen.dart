import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/post.dart';
import '../widgets/stories.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

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
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (ctx, i) => i == 0 ? const Stories() : const Post(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
