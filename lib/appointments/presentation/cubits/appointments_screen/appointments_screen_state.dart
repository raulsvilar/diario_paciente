part of 'appointments_screen_cubit.dart';

abstract class AppointmentsScreenState extends Equatable {
  const AppointmentsScreenState(this.date);
  final DateTime date;
  T? castOrNull<T>() => this is T ? this as T : null;
  @override
  List<Object> get props => [date];
}

class AppointmentsScreenInitial extends AppointmentsScreenState {
  const AppointmentsScreenInitial(DateTime date) : super(date);
}

class AppointmentsLoaded extends AppointmentsScreenState {
  final List<AppointmentEntity> listAppointments;

  const AppointmentsLoaded(
      {required DateTime date, required this.listAppointments})
      : super(date);

  @override
  List<Object> get props => [...super.props, listAppointments];
}

class AppointmentsLoading extends AppointmentsScreenState {
  const AppointmentsLoading(DateTime date) : super(date);
}
