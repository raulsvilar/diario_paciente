import 'package:diario_paciente/appointments/domain/entities/appointment_entity.dart';

abstract class IAppointmentsRepository {
  Future<List<AppointmentEntity>> loadAppointments(DateTime date);
  void deleteAppointment(AppointmentEntity appointmentEntity);
  void saveAppointment(AppointmentEntity appointmentEntity);
}
