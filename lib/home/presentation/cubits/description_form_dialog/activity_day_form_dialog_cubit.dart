import 'package:bloc/bloc.dart';
import 'package:diario_paciente/home/domain/entities/day_activity_entity.dart';
import 'package:diario_paciente/home/utils/symptoms_level_enum.dart';
import 'package:diario_paciente/utils/utils_extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'activity_day_form_dialog_state.dart';

class ActivityDayFormDialogCubit extends Cubit<ActivityDayFormDialogState> {
  ActivityDayFormDialogCubit() : super(ActivityDayFormDialogInitial());

  ActivityDayFormDialogData? get _dataState =>
      state.castOrNull<ActivityDayFormDialogData>();

  void init({required DateTime date, DayActivityEntity? dayActivityEntity}) {
    final time = TimeOfDay.fromDateTime(DateTime.now());
    emit(
      ActivityDayFormDialogData(
        dayActivityEntity: dayActivityEntity ??
            DayActivityEntity(
              date: DateTime.parse(
                  '${date.onlyDateString()} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'),
            ),
      ),
    );
  }

  void changeSymptomsLevel(SymptomsLevelEnum? symptomsLevel) {
    emit(ActivityDayFormDialogData(
      dayActivityEntity: _dataState?.dayActivityEntity?.copyWith(
        symptomsLevel: symptomsLevel?.name,
      ),
    ));
  }

  void changeUsedMedicine(bool value) {
    emit(ActivityDayFormDialogData(
      dayActivityEntity: _dataState?.dayActivityEntity?.copyWith(
        usedMedicine: value,
      ),
    ));
  }

  void setAnnotations(String annotations) {
    emit(
      ActivityDayFormDialogData(
        dayActivityEntity: _dataState?.dayActivityEntity?.copyWith(
          annotations: annotations,
        ),
      ),
    );
  }

  void setSymptom(String symptom) {
    emit(
      ActivityDayFormDialogData(
        dayActivityEntity: _dataState?.dayActivityEntity?.copyWith(
          symptom: symptom,
        ),
      ),
    );
  }
}
