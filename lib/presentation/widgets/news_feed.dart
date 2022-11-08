import 'package:flutter/material.dart';

import './post.dart';

class NewsFeed extends StatelessWidget {
  final List<Post> posts;

  const NewsFeed({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: posts.isEmpty
          ? const Center(
              child: Text('No posts added'),
            )
          : ListView.builder(
              itemCount: 5,
              itemBuilder: (ctx, i) => const Post(),
            ),
    );
  }
}
