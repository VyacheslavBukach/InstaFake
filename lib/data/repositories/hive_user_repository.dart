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
  Future<void> deleteUser(String id) async {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getAllUsers() async {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<User> getUserById(int id) async {
    var userEntity = box.get(id);
    return userEntity != null ? userMapper.toUser(userEntity) : User.empty();
  }

  @override
  Future<void> saveUser(String id) async {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
