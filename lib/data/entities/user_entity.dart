import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity extends HiveObject {
  @HiveField(0)
  final int id;

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
  final bool isChecked;

  @HiveField(8)
  final String avatarPath;

  UserEntity({
    required this.id,
    required this.posts,
    required this.followers,
    required this.followings,
    required this.name,
    required this.username,
    required this.bio,
    required this.isChecked,
    required this.avatarPath,
  });
}
