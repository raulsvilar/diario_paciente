// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentModelAdapter extends TypeAdapter<AppointmentModel> {
  @override
  final int typeId = 2;

  @override
  AppointmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentModel(
      date: fields[0] as DateTime,
      name: fields[1] as String?,
      description: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
