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
  Future<User> getUserById(int id) async {
    UserEntity? userEntity = box.get(id);
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
}
