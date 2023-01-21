import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../../utils/user_type.dart';
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
  Future<User> createOrFetchAdminProfile() async {
    var isBoxEmpty = _box.isEmpty;
    if (isBoxEmpty) {
      var userUuid = _uuid.v4();
      var newAdminProfile = User.admin(uuid: userUuid);
      var newAdminEntity = _userMapper.toUserEntity(newAdminProfile);
      await _box.put(userUuid, newAdminEntity);
      print('create and return admin profile with uuid = $userUuid');

      return newAdminProfile;
    } else {
      var admin = _box.values
          .firstWhere((element) => element.userType == UserType.admin);
      print('return admin profile with uuid = ${admin.uuid}');

      return _userMapper.toUser(admin);
    }
  }

  @override
  User createNewUserProfile() {
    var userUuid = _uuid.v4();
    print('return new user profile with uuid = $userUuid');

    return User.user(uuid: userUuid);
  }

  @override
  Future<void> saveUser(User user) async {
    var userEntity = _userMapper.toUserEntity(user);
    await _box.put(user.uuid, userEntity);
    print('save user with uuid = ${user.uuid}');
  }

  @override
  Future<List<User>> fetchAllUsersWithoutAdmin() async {
    var users = _box.values
        .where((userEntity) => userEntity.userType == UserType.user)
        .map((userEntity) => _userMapper.toUser(userEntity))
        .toList();

    return users;
  }

  @override
  Future<void> deleteUserByUuid(String userUuid) async {
    await _box.delete(userUuid);
    print('delete user with uuid = $userUuid');
  }
}
