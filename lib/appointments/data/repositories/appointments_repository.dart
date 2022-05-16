import 'package:diario_paciente/appointments/data/datasources/appointments_datasource.dart';
import 'package:diario_paciente/appointments/domain/entities/appointment_entity.dart';
import 'package:diario_paciente/appointments/domain/repositories/i_appointments_repository.dart';

class AppointmentsRepository extends IAppointmentsRepository {
  final AppointmentsDatasource _datasource;
  AppointmentsRepository({required AppointmentsDatasource datasource})
      : _datasource = datasource;
  @override
  void deleteAppointment(AppointmentEntity appointmentEntity) {
    _datasource.deleteAppointment(appointmentEntity);
  }

  @override
  Future<List<AppointmentEntity>> loadAppointments(DateTime date) async {
    return await _datasource.loadAppointment(date);
  }

  @override
  void saveAppointment(AppointmentEntity appointmentEntity) {
    _datasource.saveAppointment(appointmentEntity);
  }
}
