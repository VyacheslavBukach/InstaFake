// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 0;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      uuid: fields[0] as String,
      posts: fields[1] as int,
      followers: fields[2] as int,
      followings: fields[3] as int,
      name: fields[4] as String,
      username: fields[5] as String,
      bio: fields[6] as String,
      isVerified: fields[7] as bool,
      avatarPath: fields[8] as String,
      storyList: (fields[9] as List).cast<String>(),
      userType: fields[10] as UserType,
      isOnline: fields[11] as bool,
      videoList: (fields[12] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.posts)
      ..writeByte(2)
      ..write(obj.followers)
      ..writeByte(3)
      ..write(obj.followings)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.username)
      ..writeByte(6)
      ..write(obj.bio)
      ..writeByte(7)
      ..write(obj.isVerified)
      ..writeByte(8)
      ..write(obj.avatarPath)
      ..writeByte(9)
      ..write(obj.storyList)
      ..writeByte(10)
      ..write(obj.userType)
      ..writeByte(11)
      ..write(obj.isOnline)
      ..writeByte(12)
      ..write(obj.videoList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
