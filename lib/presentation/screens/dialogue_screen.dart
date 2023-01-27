import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dialogue_controller.dart';
import '../widgets/avatar_widget.dart';

class DialogueScreen extends GetView<DialogueController> {
  const DialogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Row(
            children: [
              AvatarWidget(
                avatar: controller.user.avatar,
                hasStory: controller.user.storyList.isNotEmpty,
                radius: 16,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.user.name,
                    style: Get.textTheme.bodyLarge,
                  ),
                  Text(
                    controller.user.username,
                    style: Get.textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam_outlined)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  BubbleNormal(
                    text: 'bubble normal without tail',
                    isSender: false,
                    color: Color(0xFFE8E8EE),
                    tail: false,
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  BubbleNormal(
                    text: 'bubble normal without tail',
                    isSender: false,
                    color: Color(0xFFE8E8EE),
                    tail: false,
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  BubbleNormal(
                    text:
                        'bubble normal bubble normal without tailbubble normal without tailbubble normal without tailbubble normal without tailbubble normal without tailbubble normal without tailbubble normal without tailwithout tail',
                    isSender: false,
                    color: Color(0xFFE8E8EE),
                    tail: false,
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  BubbleNormal(
                    text: 'bubble normal without tail',
                    isSender: false,
                    color: Color(0xFFE8E8EE),
                    tail: false,
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  BubbleNormal(
                    text:
                        'bubble normbubble normal without tailbubble normal without tailbubble normal without tailbubble normal without tailbubble normal without tailbubble normal without tailal without tail',
                    isSender: false,
                    color: Color(0xFFE8E8EE),
                    tail: false,
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  BubbleNormal(
                    text: 'bubble normal without tail',
                    isSender: false,
                    color: Color(0xFFE8E8EE),
                    tail: false,
                    textStyle: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  BubbleNormal(
                    text:
                        'bubble normal withoububble normal without tailbubble normal without tailbubble normal without tailbubble normal without tailbubble normal without tailbubble normal without tailbubble normal without tailt tail',
                    isSender: true,
                    color: Color(0xFF1B97F3),
                    tail: false,
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          MessageBar(
            onSend: (_) => print(_),
            actions: [
              InkWell(
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 24,
                ),
                onTap: () {},
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.green,
                    size: 24,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
