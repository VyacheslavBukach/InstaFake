import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTopText extends StatelessWidget {
  final String title;
  final int amount;

  const ProfileTopText({
    Key? key,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$amount',
          style: Get.textTheme.titleLarge,
        ),
        Text(
          title.tr,
          style: Get.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
