import '../../domain/models/user.dart';
import '../entities/user_entity.dart';

class UserMapper {
  User toUser(UserEntity userEntity) => User(
        id: userEntity.id,
        avatar: userEntity.avatar,
        bio: userEntity.bio,
        followers: userEntity.followers,
        followings: userEntity.followings,
        isChecked: userEntity.isChecked,
        name: userEntity.name,
        posts: userEntity.posts,
        username: userEntity.username,
      );

  UserEntity toUserEntity(User user) => UserEntity(
        id: user.id,
        posts: user.posts,
        followers: user.followers,
        followings: user.followings,
        name: user.name,
        username: user.username,
        bio: user.bio,
        isChecked: user.isChecked,
        avatar: user.avatar,
      );
}
