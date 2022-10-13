import 'package:hive/hive.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../entities/user_entity.dart';
import '../mappers/user_mapper.dart';

class HiveUserRepository implements UserRepository {
  final Box<UserEntity> box;
  final UserMapper userMapper;

  const HiveUserRepository({
    required this.box,
    required this.userMapper,
  });

  @override
  Future<User> fetchUserById(int userId) async {
    UserEntity? userEntity = box.get(userId);
    // check if user exists - return it, if no - create with id 0
    if (userEntity == null) {
      var newUser = User.empty();
      var newUserEntity = userMapper.toUserEntity(newUser);
      box.add(newUserEntity);
      return newUser;
    } else {
      return userMapper.toUser(userEntity);
    }
  }

  @override
  Future<void> saveUser(User user) async {
    var userEntity = userMapper.toUserEntity(user);
    box.putAt(user.id, userEntity);
  }

  @override
  Future<List<User>> fetchUsers() async {
    return box.values.map((entity) => userMapper.toUser(entity)).toList();
  }
}
