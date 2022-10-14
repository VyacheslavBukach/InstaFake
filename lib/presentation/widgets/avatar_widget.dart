import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarWidget extends StatelessWidget {
  final File? avatar;
  final VoidCallback? onTap;
  final double radius;
  final bool hasStory;

  const AvatarWidget({
    Key? key,
    this.onTap,
    required this.avatar,
    required this.hasStory,
    required this.radius,
  }) : super(key: key);

  static const _gradientBorderDecoration = BoxDecoration(
    shape: BoxShape.circle,
    // https://brandpalettes.com/instagram-color-codes/
    gradient: SweepGradient(
      colors: [
        Color(0xFF833AB4), // Purple
        Color(0xFFF77737), // Orange
        Color(0xFFE1306C), // Red-pink
        Color(0xFFC13584), // Red-purple
      ],
    ),
  );
  static const _whiteBorderDecoration = BoxDecoration(
    shape: BoxShape.circle,
    border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 3.0)),
  );
  static const _greyBoxShadowDecoration = BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(color: Colors.grey, blurRadius: 1.0, spreadRadius: 1.0)
    ],
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: hasStory ? _gradientBorderDecoration : null,
        height: radius * 2 + 10,
        width: radius * 2 + 10,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: _whiteBorderDecoration,
              child: Container(
                // decoration: _greyBoxShadowDecoration,
                child: avatar != null
                    ? CircleAvatar(
                        radius: radius,
                        backgroundImage: FileImage(
                          avatar ?? File(''),
                        ),
                      )
                    : SvgPicture.asset(
                        'assets/empty_avatar.svg',
                        height: radius * 2,
                        width: radius * 2,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
