import 'package:hive/hive.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';

class HiveUserRepository implements UserRepository {
  final Box<UserEntity> box;

  const HiveUserRepository({required this.box});

  @override
  Future<void> deleteUser(String id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<User> getUserById(String id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<void> saveUser(String id) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
