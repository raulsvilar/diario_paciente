import 'package:diario_paciente/home/domain/entities/day_activity_entity.dart';
import 'package:hive/hive.dart';

part 'day_activity_model.g.dart';

@HiveType(typeId: 1)
// ignore: must_be_immutable
class DayActivityModel extends DayActivityEntity with HiveObjectMixin {
  DayActivityModel({
    bool usedMedicine = false,
    String? annotations,
    String? symptom,
    String? symptomsLevel,
    required DateTime date,
  }) : super(
          date: date,
          usedMedicine: usedMedicine,
          annotations: annotations,
          symptom: symptom,
          symptomsLevel: symptomsLevel,
        );
  @override
  @HiveField(0)
  bool get usedMedicine;
  @override
  @HiveField(1)
  String? get annotations;
  @override
  @HiveField(2)
  String? get symptom;
  @override
  @HiveField(3)
  String? get symptomsLevel;
  @override
  @HiveField(5)
  DateTime get date;

  factory DayActivityModel.fromEntity(DayActivityEntity entity) {
    return DayActivityModel(
        usedMedicine: entity.usedMedicine,
        annotations: entity.annotations,
        symptom: entity.symptom,
        symptomsLevel: entity.symptomsLevel,
        date: entity.date);
  }
}
