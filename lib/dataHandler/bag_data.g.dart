// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BagItemAdapter extends TypeAdapter<BagItem> {
  @override
  final int typeId = 2;

  @override
  BagItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BagItem(
      name: fields[0] as String,
      description: fields[1] as String?,
      isChecked: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BagItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BagItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BagCategoryAdapter extends TypeAdapter<BagCategory> {
  @override
  final int typeId = 3;

  @override
  BagCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BagCategory(
      title: fields[0] as String,
      country: fields[1] as String,
      items: (fields[2] as List).cast<BagItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, BagCategory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.country)
      ..writeByte(2)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BagCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
