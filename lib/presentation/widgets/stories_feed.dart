import 'package:flutter/material.dart';

import './story.dart';
import '../../utils/story_type.dart';

class StoriesFeed extends StatelessWidget {
  final List<Story> stories;

  const StoriesFeed({
    Key? key,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (ctx, i) => i == 0
            ? const Story(type: StoryType.myStory)
            : stories.isEmpty
                ? Container()
                : const Story(type: StoryType.story),
        separatorBuilder: (ctx, i) => const SizedBox(width: 16),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16, right: 16),
      ),
    );
  }
}
