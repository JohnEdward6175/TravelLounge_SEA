// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DocumentItemAdapter extends TypeAdapter<DocumentItem> {
  @override
  final int typeId = 5;

  @override
  DocumentItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DocumentItem(
      name: fields[0] as String,
      description: fields[1] as String?,
      isChecked: fields[2] as bool,
      imagePath: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DocumentItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.isChecked)
      ..writeByte(3)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DocumentItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DocumentListAdapter extends TypeAdapter<DocumentList> {
  @override
  final int typeId = 6;

  @override
  DocumentList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DocumentList(
      title: fields[0] as String,
      country: fields[1] as String,
      items: (fields[2] as List).cast<DocumentItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, DocumentList obj) {
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
      other is DocumentListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
