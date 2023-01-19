import 'package:hive/hive.dart';

import '../../utils/user_type.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity extends HiveObject {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  final int posts;

  @HiveField(2)
  final int followers;

  @HiveField(3)
  final int followings;

  @HiveField(4)
  final String name;

  @HiveField(5)
  final String username;

  @HiveField(6)
  final String bio;

  @HiveField(7)
  final bool isVerified;

  @HiveField(8)
  final String avatarPath;

  @HiveField(9)
  final List<String> storyList;

  @HiveField(10)
  final UserType userType;

  @HiveField(11)
  final bool isOnline;

  UserEntity({
    required this.uuid,
    required this.posts,
    required this.followers,
    required this.followings,
    required this.name,
    required this.username,
    required this.bio,
    required this.isVerified,
    required this.avatarPath,
    required this.storyList,
    required this.userType,
    required this.isOnline,
  });
}
