// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterCacheAdapter extends TypeAdapter<CharacterCache> {
  @override
  final int typeId = 1;

  @override
  CharacterCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterCache(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      modified: fields[3] as String,
      imageUrl: fields[4] as String,
      comics: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CharacterCache obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.modified)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.comics);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
