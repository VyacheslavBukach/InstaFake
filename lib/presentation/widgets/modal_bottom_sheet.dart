import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalBottomSheet extends StatelessWidget {
  final String title;
  final List<ListTile> tiles;

  const ModalBottomSheet({
    super.key,
    this.title = '',
    required this.tiles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Wrap(
        children: [
          title != ''
              ? Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Center(
                        child: Text(
                          title,
                          style: Get.textTheme.headline5,
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                )
              : const SizedBox.shrink(),
          ...tiles,
        ],
      ),
    );
  }
}
