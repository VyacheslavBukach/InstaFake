import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_fake/screens/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Nickname'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_box_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(radius: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('5'),
                    Text('Публикации'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('5'),
                    Text('Подписчики'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('5'),
                    Text('Подписки'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Nickname'),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade200,
                  onPrimary: Colors.black,
                  elevation: 0,
                  minimumSize: Size.fromHeight(30)),
              onPressed: () {
                Get.toNamed(EditProfileScreen.routeName);
              },
              child: Text('Редактировать профиль'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
