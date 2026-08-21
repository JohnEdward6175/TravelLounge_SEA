// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiaryEntryAdapter extends TypeAdapter<DiaryEntry> {
  @override
  final int typeId = 0;

  @override
  DiaryEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiaryEntry(
      id: fields[0] as String,
      title: fields[1] as String,
      date: fields[2] as String,
      time: fields[3] as String,
      preview: fields[4] as String,
      image: (fields[5] as List).cast<String>(),
      isChecklist: fields[6] as bool,
      checklistItems: (fields[7] as List).cast<String>(),
      checklistStates: (fields[8] as List).cast<bool>(),
      imageNames: (fields[9] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, DiaryEntry obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.preview)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.isChecklist)
      ..writeByte(7)
      ..write(obj.checklistItems)
      ..writeByte(8)
      ..write(obj.checklistStates)
      ..writeByte(9)
      ..write(obj.imageNames);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiaryEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
