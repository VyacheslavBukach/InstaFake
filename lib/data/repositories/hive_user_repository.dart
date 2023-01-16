import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../entities/user_entity.dart';
import '../mappers/user_mapper.dart';

class HiveUserRepository implements UserRepository {
  final Box<UserEntity> _box;
  final UserMapper _userMapper;
  final Uuid _uuid;

  HiveUserRepository(
    this._box,
    this._userMapper,
    this._uuid,
  );

  @override
  Future<void> createAdminProfile() async {
    var isBoxEmpty = _box.isEmpty;
    if (isBoxEmpty) {
      var userUuid = _uuid.v4();
      var newAdminProfile = User.admin(uuid: userUuid);
      var newAdminEntity = _userMapper.toUserEntity(newAdminProfile);
      await _box.put(userUuid, newAdminEntity);
      print('create admin profile with uuid=$userUuid');
    } else {
      print('admin profile has been already created');
    }
  }

  @override
  User createNewUserProfile() {
    var userUuid = _uuid.v4();
    print('return new user profile with uuid=$userUuid');

    return User.user(uuid: userUuid);
  }

  @override
  Future<User> fetchUserByUuid(String uuid) async {
    UserEntity? userEntity = _box.get(uuid);
    if (userEntity == null) {
      print('user with uuid $uuid does not exist. new user returned');

      return createNewUserProfile();
    } else {
      return _userMapper.toUser(userEntity);
    }
  }

  @override
  Future<void> saveUser(User user) async {
    var userEntity = _userMapper.toUserEntity(user);
    await _box.put(user.uuid, userEntity);
    print('save user with uuid ${user.uuid}');
  }

  @override
  Future<List<User>> fetchAllUsers() async {
    return _box.values.map((entity) => _userMapper.toUser(entity)).toList();
  }

  @override
  Future<void> deleteUserByUuid(String userUuid) async {
    await _box.delete(userUuid);
    print('delete user with uuid $userUuid');
  }
}
