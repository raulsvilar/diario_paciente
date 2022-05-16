import 'package:bloc/bloc.dart';
import 'package:diario_paciente/appointments/domain/entities/appointment_entity.dart';
import 'package:diario_paciente/utils/utils_extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'appointment_form_dialog_state.dart';

class AppointmentFormDialogCubit extends Cubit<AppointmentFormDialogState> {
  AppointmentFormDialogCubit() : super(AppointmentFormDialogInitial());

  AppointmentFormDialogData? get _dataState =>
      state.castOrNull<AppointmentFormDialogData>();

  void init({required DateTime date, AppointmentEntity? appointmentEntity}) {
    final time = TimeOfDay.now();
    emit(
      AppointmentFormDialogData(
        appointmentEntity: appointmentEntity ??
            AppointmentEntity(
              date: DateTime.parse(
                  '${date.onlyDateString()} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'),
            ),
      ),
    );
  }

  void setDescription(String description) {
    emit(
      AppointmentFormDialogData(
        appointmentEntity: _dataState?.appointmentEntity?.copyWith(
          description: description,
        ),
      ),
    );
  }

  void setName(String name) {
    emit(
      AppointmentFormDialogData(
        appointmentEntity: _dataState?.appointmentEntity?.copyWith(
          name: name,
        ),
      ),
    );
  }

  void setTime(TimeOfDay time) {
    emit(
      AppointmentFormDialogData(
        appointmentEntity: _dataState?.appointmentEntity?.copyWith(
          date: DateTime.parse(
              '${_dataState?.appointmentEntity?.date.onlyDateString()} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'),
        ),
      ),
    );
  }
}
