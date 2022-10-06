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
    required this.id,
    required this.posts,
    required this.followers,
    required this.followings,
    required this.name,
    required this.userName,
    required this.bio,
    required this.isChecked,
    required this.avatar,
  });

  User.empty()
      : this(
          id: '',
          posts: 5,
          followers: 10,
          followings: 15,
          name: 'Name',
          userName: 'Nickname',
          bio: 'Bio',
          isChecked: false,
          avatar: null,
        );
}
