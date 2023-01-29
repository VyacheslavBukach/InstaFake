import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../utils/user_type.dart';

class User extends Equatable {
  final String uuid;
  final UserType userType;
  final int posts;
  final int followers;
  final int followings;
  final String name;
  final String username;
  final String bio;
  final bool isVerified;
  final File? avatar;
  final List<String> storyList;
  final List<String> videoList;
  final bool isOnline;

  const User({
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
    required this.videoList,
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
          videoList: [],
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
          videoList: [],
          isOnline: true,
        );

  @override
  List<Object?> get props => [
        uuid,
        userType,
        posts,
        followers,
        followings,
        name,
        username,
        bio,
        isVerified,
        avatar,
        storyList,
        videoList,
        isOnline,
      ];

  @override
  bool get stringify => true;
}
