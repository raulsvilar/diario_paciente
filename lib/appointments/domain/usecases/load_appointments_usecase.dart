import 'package:diario_paciente/appointments/domain/entities/appointment_entity.dart';
import 'package:diario_paciente/appointments/domain/repositories/i_appointments_repository.dart';

class LoadAppointmentsUseCase {
  const LoadAppointmentsUseCase({required IAppointmentsRepository repository})
      : _repository = repository;
  final IAppointmentsRepository _repository;

  Future<List<AppointmentEntity>> call(DateTime date) {
    return _repository.loadAppointments(date);
  }
}
