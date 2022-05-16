import 'package:diario_paciente/appointments/domain/entities/appointment_entity.dart';
import 'package:diario_paciente/appointments/domain/repositories/i_appointments_repository.dart';

class DeleteAppointmentUseCase {
  const DeleteAppointmentUseCase({required IAppointmentsRepository repository})
      : _repository = repository;
  final IAppointmentsRepository _repository;

  call(AppointmentEntity appointmentEntity) {
    _repository.deleteAppointment(appointmentEntity);
  }
}
