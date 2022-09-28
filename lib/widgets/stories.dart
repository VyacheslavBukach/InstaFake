import 'package:flutter/material.dart';

import './story.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      // padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (ctx, i) => const Story(),
        separatorBuilder: (ctx, i) => const SizedBox(width: 16),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16, right: 16),
      ),
    );
  }
}
