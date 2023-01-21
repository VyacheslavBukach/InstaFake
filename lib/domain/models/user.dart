import 'dart:io';

import '../../utils/user_type.dart';

class User {
  final String uuid;
  UserType userType;
  int posts;
  int followers;
  int followings;
  String name;
  String username;
  String bio;
  bool isVerified;
  File? avatar;
  List<String> storyList;
  bool isOnline;

  User({
    required this.uuid,
    required this.userType,
    required this.posts,
    required this.followers,
    required this.followings,
    required this.name,
    required this.username,
    required this.bio,
    required this.isVerified,
    required this.avatar,
    required this.storyList,
    required this.isOnline,
  });

  User.user({required String uuid})
      : this(
          uuid: uuid,
          userType: UserType.user,
          posts: 5,
          followers: 10,
          followings: 15,
          name: 'Name',
          username: 'Username',
          bio: 'Bio',
          isVerified: false,
          avatar: null,
          storyList: [],
          isOnline: true,
        );

  User.admin({required String uuid})
      : this(
          uuid: uuid,
          userType: UserType.admin,
          posts: 5,
          followers: 10,
          followings: 15,
          name: 'My name',
          username: 'My username',
          bio: 'Bio',
          isVerified: true,
          avatar: null,
          storyList: [],
          isOnline: true,
        );
}
