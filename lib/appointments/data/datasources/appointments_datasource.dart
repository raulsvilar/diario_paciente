import 'package:diario_paciente/appointments/data/models/appointment_model.dart';
import 'package:diario_paciente/appointments/domain/entities/appointment_entity.dart';
import 'package:diario_paciente/utils/hive_boxes_enum.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppointmentsDatasource {
  void saveAppointment(AppointmentEntity appointmentEntity) async {
    final box =
        await Hive.openBox<AppointmentModel>(HiveBoxesEnum.appointments.name);
    await box.add(AppointmentModel.fromEntity(appointmentEntity));
  }

  Future<List<AppointmentEntity>> loadAppointment(DateTime date) async {
    final box =
        await Hive.openBox<AppointmentModel>(HiveBoxesEnum.appointments.name);
    final result = box.values.where(
      (element) {
        return DateUtils.isSameDay(element.date, date);
      },
    ).toList();
    return result;
  }

  void deleteAppointment(AppointmentEntity appointmentEntity) async {
    final box =
        await Hive.openBox<AppointmentModel>(HiveBoxesEnum.appointments.name);
    final result =
        box.values.firstWhere((element) => element == appointmentEntity);
    box.delete(result.key);
  }
}
