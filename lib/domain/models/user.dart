import 'dart:io';

class User {
  final int id;
  int posts;
  int followers;
  int followings;
  String name;
  String username;
  String bio;
  bool isVerified;
  File? avatar;

  User({
    required this.id,
    required this.posts,
    required this.followers,
    required this.followings,
    required this.name,
    required this.username,
    required this.bio,
    required this.isVerified,
    required this.avatar,
  });

  User.empty()
      : this(
          id: 0,
          posts: 5,
          followers: 10,
          followings: 15,
          name: 'Name',
          username: 'Username',
          bio: 'Bio',
          isVerified: false,
          avatar: null,
        );
}
