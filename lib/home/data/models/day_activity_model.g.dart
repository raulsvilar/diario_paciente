// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_activity_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayActivityModelAdapter extends TypeAdapter<DayActivityModel> {
  @override
  final int typeId = 1;

  @override
  DayActivityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayActivityModel(
      usedMedicine: fields[0] as bool,
      annotations: fields[1] as String?,
      symptom: fields[2] as String?,
      symptomsLevel: fields[3] as String?,
      date: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, DayActivityModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.usedMedicine)
      ..writeByte(1)
      ..write(obj.annotations)
      ..writeByte(2)
      ..write(obj.symptom)
      ..writeByte(3)
      ..write(obj.symptomsLevel)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayActivityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
