import 'package:diario_paciente/appointments/domain/entities/appointment_entity.dart';
import 'package:hive/hive.dart';

part 'appointment_model.g.dart';

@HiveType(typeId: 2)
// ignore: must_be_immutable
class AppointmentModel extends AppointmentEntity with HiveObjectMixin {
  AppointmentModel({
    required DateTime date,
    required String? name,
    required String? description,
  }) : super(date: date, name: name, description: description);
  @override
  @HiveField(0)
  DateTime get date;
  @override
  @HiveField(1)
  String? get name;
  @override
  @HiveField(2)
  String? get description;

  factory AppointmentModel.fromEntity(AppointmentEntity appointmentEntity) {
    return AppointmentModel(
      date: appointmentEntity.date,
      name: appointmentEntity.name,
      description: appointmentEntity.description,
    );
  }
}
