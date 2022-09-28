import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  const Story({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: const [
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
        ],
      ),
    );
  }
}
