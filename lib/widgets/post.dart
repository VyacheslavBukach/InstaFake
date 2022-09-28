import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(radius: 15),
              const SizedBox(width: 16),
              const Text('feth'),
              const Spacer(),
              IconButton(
                onPressed: () {},
                // splashRadius: null,
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
        Container(
          height: 500,
          color: Colors.limeAccent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mode_comment_outlined,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.send_outlined,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_outline,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Liked: 100'),
              Row(
                children: const [
                  Text('Name'),
                  Text('Text'),
                ],
              ),
              const Text('See all commnets'),
              Row(
                children: const [
                  Text('15 min ago'),
                  Text('Show translate'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
