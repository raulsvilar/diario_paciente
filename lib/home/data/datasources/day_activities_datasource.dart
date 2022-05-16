import 'package:diario_paciente/home/data/models/day_activity_model.dart';
import 'package:diario_paciente/home/domain/entities/day_activity_entity.dart';
import 'package:diario_paciente/utils/hive_boxes_enum.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DayActivitiesDatasource {
  void saveDayActivity(DayActivityEntity dayActivityEntity) async {
    final box =
        await Hive.openBox<DayActivityModel>(HiveBoxesEnum.dayActivities.name);
    await box.add(DayActivityModel.fromEntity(dayActivityEntity));
  }

  Future<List<DayActivityEntity>> loadDayActivities(DateTime date) async {
    final box =
        await Hive.openBox<DayActivityModel>(HiveBoxesEnum.dayActivities.name);
    final result = box.values.where(
      (element) {
        return DateUtils.isSameDay(element.date, date);
      },
    ).toList();
    return result;
  }

  void deleteDayActivity(DayActivityEntity dayActivityEntity) async {
    final box =
        await Hive.openBox<DayActivityModel>(HiveBoxesEnum.dayActivities.name);
    final result =
        box.values.firstWhere((element) => element == dayActivityEntity);
    box.delete(result.key);
  }
}
