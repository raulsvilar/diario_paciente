import 'package:bloc/bloc.dart';
import 'package:diario_paciente/appointments/domain/entities/appointment_entity.dart';
import 'package:diario_paciente/appointments/domain/usecases/delete_appointment_usecase.dart';
import 'package:diario_paciente/appointments/domain/usecases/load_appointments_usecase.dart';
import 'package:diario_paciente/appointments/domain/usecases/save_appointment_usecase.dart';
import 'package:diario_paciente/config/notifications_config.dart';
import 'package:equatable/equatable.dart';

part 'appointments_screen_state.dart';

class AppointmentsScreenCubit extends Cubit<AppointmentsScreenState> {
  AppointmentsScreenCubit({
    required LoadAppointmentsUseCase loadAppointmentsUseCase,
    required SaveAppointmentUseCase saveAppointmentUseCase,
    required DeleteAppointmentUseCase deleteAppointmentUseCase,
  })  : _loadAppointmentsUseCase = loadAppointmentsUseCase,
        _saveAppointmentUseCase = saveAppointmentUseCase,
        _deleteAppointmentUseCase = deleteAppointmentUseCase,
        super(AppointmentsScreenInitial(DateTime.now()));

  final LoadAppointmentsUseCase _loadAppointmentsUseCase;
  final SaveAppointmentUseCase _saveAppointmentUseCase;
  final DeleteAppointmentUseCase _deleteAppointmentUseCase;

  void init() async {
    emit(AppointmentsLoading(state.date));
    emit(AppointmentsLoaded(
      date: state.date,
      listAppointments: await _loadAppointmentsUseCase(state.date),
    ));
  }

  void changeDate(DateTime? date) async {
    emit(AppointmentsLoading(date ?? state.date));
    emit(AppointmentsLoaded(
      date: state.date,
      listAppointments: await _loadAppointmentsUseCase(state.date),
    ));
  }

  deleteAppointment(AppointmentEntity appointmentEntity) async {
    emit(AppointmentsLoading(state.date));
    _deleteAppointmentUseCase(appointmentEntity);
    emit(AppointmentsLoaded(
      date: state.date,
      listAppointments: await _loadAppointmentsUseCase(state.date),
    ));
  }

  void addAppointment(AppointmentEntity? appointmentEntity) async {
    if (appointmentEntity != null) {
      emit(AppointmentsLoading(state.date));
      _saveAppointmentUseCase(appointmentEntity);
      NotificationsConfig.scheduleNotification(
        title: appointmentEntity.name!,
        body: appointmentEntity.description!,
        dateTime: appointmentEntity.date,
      );
      emit(AppointmentsLoaded(
        date: state.date,
        listAppointments: await _loadAppointmentsUseCase(state.date),
      ));
    }
  }
}
