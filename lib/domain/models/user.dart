import 'dart:io';

class User {
  final String id;
  final int posts;
  final int followers;
  final int followings;
  final String name;
  final String userName;
  final String bio;
  final bool isChecked;
  final File? avatar;

  User({
    this.id = '',
    this.posts = 0,
    this.followers = 0,
    this.followings = 0,
    this.name = '',
    this.userName = '',
    this.bio = '',
    this.isChecked = false,
    this.avatar,
  });
}
