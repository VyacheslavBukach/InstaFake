import 'package:hive/hive.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../entities/user_entity.dart';
import '../mappers/user_mapper.dart';

class HiveUserRepository implements UserRepository {
  final Box<UserEntity> _box;
  final UserMapper _userMapper;

  HiveUserRepository(
    this._box,
    this._userMapper,
  );

  @override
  Future<void> createMyProfile() async {
    UserEntity? userEntity = _box.get(0);
    // check if user exists - return it, if no - create with id 0
    if (userEntity == null) {
      var newUser = User.empty();
      var newUserEntity = _userMapper.toUserEntity(newUser);
      _box.add(newUserEntity);
    } else {
      return;
    }
  }

  @override
  Future<User> fetchUserById(int userId) async {
    // TODO
    UserEntity? userEntity = _box.get(userId);
    if (userEntity == null) {
      var newUser = User.empty();
      var newUserEntity = _userMapper.toUserEntity(newUser);
      _box.add(newUserEntity);
      return newUser;
    } else {
      return _userMapper.toUser(userEntity);
    }
  }

  @override
  Future<void> saveUser(User user) async {
    var userEntity = _userMapper.toUserEntity(user);
    _box.putAt(user.id, userEntity);
  }

  @override
  Future<List<User>> fetchAllUsers() async {
    return _box.values.map((entity) => _userMapper.toUser(entity)).toList();
  }

  @override
  Future<void> deleteUserById(int userId) async {
    _box.deleteAt(userId);
  }
}
