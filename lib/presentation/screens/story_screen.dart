import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:story/story.dart';

import '../../domain/models/user.dart';

class StoryScreen extends StatelessWidget {
  final User user;

  const StoryScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: StoryPageView(
          itemBuilder: (context, _, storyIndex) => Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: Image.file(
                  File(user.storyList[storyIndex]),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44, left: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      child: user.avatar != null
                          ? CircleAvatar(
                              backgroundImage: FileImage(
                                user.avatar ?? File(''),
                              ),
                            )
                          : SvgPicture.asset('assets/empty_avatar.svg'),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      user.username,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: Get.mediaQuery.padding.top,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  width: Get.mediaQuery.size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.mediaQuery.size.width * 0.75,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Send message',
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            hintStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 0.5,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      const Icon(Icons.favorite_outline),
                      const Icon(Icons.send_outlined),
                    ],
                  ),
                ),
              ),
            ],
          ),
          storyLength: (i) => user.storyList.length,
          pageLength: 1,
          indicatorPadding: EdgeInsets.only(
            top: Get.mediaQuery.padding.top,
            left: 8,
            right: 8,
          ),
          onPageLimitReached: () {
            // Get.back();
          },
        ),
      ),
    );
  }
}
