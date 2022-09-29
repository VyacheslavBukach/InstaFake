import 'package:flutter/material.dart';

import '../../utils/story_type.dart';

class Story extends StatelessWidget {
  final StoryType type;

  const Story({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: type == StoryType.myStory ? _myStory() : _story(),
      ),
    );
  }

  List<Widget> _story() => const [
        Expanded(
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.red,
            child: CircleAvatar(
              radius: 33,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ),
        Text(
          'fdghfghdfhdhhgf',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ];

  List<Widget> _myStory() => const [
        Expanded(
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
          ),
        ),
        Text(
          'My story',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ];
}
