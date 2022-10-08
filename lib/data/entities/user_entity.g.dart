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
      id: fields[0] as int,
      posts: fields[1] as int,
      followers: fields[2] as int,
      followings: fields[3] as int,
      name: fields[4] as String,
      username: fields[5] as String,
      bio: fields[6] as String,
      isChecked: fields[7] as bool,
      avatar: fields[8] as File?,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
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
      ..write(obj.isChecked)
      ..writeByte(8)
      ..write(obj.avatar);
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
