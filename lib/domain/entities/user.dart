import 'dart:io';

import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final int posts;

  @HiveField(2)
  final int followers;

  @HiveField(3)
  final int followings;

  @HiveField(4)
  final String name;

  @HiveField(5)
  final String userName;

  @HiveField(6)
  final String bio;

  @HiveField(7)
  final bool isChecked;

  @HiveField(8)
  final File avatar;

  User(
    this.id,
    this.posts,
    this.followers,
    this.followings,
    this.name,
    this.userName,
    this.bio,
    this.isChecked,
    this.avatar,
  );
}
