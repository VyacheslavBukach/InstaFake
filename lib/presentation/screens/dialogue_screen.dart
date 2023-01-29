import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_navigation.dart';
import '../controllers/dialogue_controller.dart';
import '../widgets/avatar_widget.dart';

class DialogueScreen extends GetView<DialogueController> {
  const DialogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => ListTile(
            leading: AvatarWidget(
              avatar: controller.user.avatar,
              hasStory: controller.user.storyList.isNotEmpty,
              radius: 16,
            ),
            title: Text(
              controller.user.name,
              overflow: TextOverflow.ellipsis,
              style: Get.textTheme.bodyLarge,
            ),
            subtitle: Text(
              controller.user.username,
              overflow: TextOverflow.ellipsis,
              style: Get.textTheme.bodySmall,
            ),
            contentPadding: const EdgeInsets.all(0),
            visualDensity: VisualDensity.compact,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.videocam_outlined),
          ),
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onSelected: (id) {
              if (id == 1) {
                Get.toNamed(
                  AppRoutes.videoEditor,
                  arguments: controller.user.uuid,
                );
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                value: 1,
                child: Text('Choose video'),
              ),
            ],
          ),
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
