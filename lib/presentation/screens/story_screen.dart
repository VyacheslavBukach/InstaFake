import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:story/story_page_view/story_page_view.dart';

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
            Get.back();
          },
        ),
      ),
    );
  }
}
