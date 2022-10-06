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
        userName: userEntity.userName,
      );
}
