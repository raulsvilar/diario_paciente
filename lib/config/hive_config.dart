import 'package:diario_paciente/appointments/data/models/appointment_model.dart';
import 'package:diario_paciente/home/data/models/day_activity_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveConfig {
  static void setup() {
    Hive.registerAdapter(DayActivityModelAdapter());
    Hive.registerAdapter(AppointmentModelAdapter());
  }
}
