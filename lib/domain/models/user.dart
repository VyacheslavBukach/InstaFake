import 'dart:io';

class User {
  final int id;
  final int posts;
  final int followers;
  final int followings;
  final String name;
  final String username;
  final String bio;
  final bool isChecked;
  final File? avatar;

  User({
    required this.id,
    required this.posts,
    required this.followers,
    required this.followings,
    required this.name,
    required this.username,
    required this.bio,
    required this.isChecked,
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
          isChecked: false,
          avatar: null,
        );
}
