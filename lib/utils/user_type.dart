import 'package:hive/hive.dart';

part 'user_type.g.dart';

@HiveType(typeId: 1)
enum UserType {
  @HiveField(0)
  user,
  @HiveField(1)
  admin,
}
