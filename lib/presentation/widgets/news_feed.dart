import 'package:flutter/material.dart';

import './post.dart';

class NewsFeed extends StatelessWidget {
  final List<Post> posts;

  const NewsFeed({
    super.key,
    required this.posts,
  });

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
