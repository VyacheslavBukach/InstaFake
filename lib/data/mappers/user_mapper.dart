import 'dart:io';

import '../../domain/models/user.dart';
import '../entities/user_entity.dart';

class UserMapper {
  User toUser(UserEntity userEntity) => User(
        uuid: userEntity.uuid,
        avatar:
            userEntity.avatarPath == '' ? null : File(userEntity.avatarPath),
        bio: userEntity.bio,
        followers: userEntity.followers,
        followings: userEntity.followings,
        isVerified: userEntity.isVerified,
        name: userEntity.name,
        posts: userEntity.posts,
        username: userEntity.username,
        storyList: userEntity.storyList,
        userType: userEntity.userType,
        isOnline: userEntity.isOnline,
        videoList: userEntity.videoList,
      );

  UserEntity toUserEntity(User user) => UserEntity(
        uuid: user.uuid,
        posts: user.posts,
        followers: user.followers,
        followings: user.followings,
        name: user.name,
        username: user.username,
        bio: user.bio,
        isVerified: user.isVerified,
        avatarPath: user.avatar?.path ?? '',
        storyList: user.storyList,
        userType: user.userType,
        isOnline: user.isOnline,
        videoList: user.videoList,
      );
}
