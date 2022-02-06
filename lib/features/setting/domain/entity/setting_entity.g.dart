// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingSystemAdapter extends TypeAdapter<SettingEntity> {
  @override
  final int typeId = 1;

  @override
  SettingEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingEntity(
      appTheme: fields[0] as String?,
      locale: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SettingEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.appTheme)
      ..writeByte(1)
      ..write(obj.locale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingSystemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
