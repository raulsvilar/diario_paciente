part of 'appointment_form_dialog_cubit.dart';

abstract class AppointmentFormDialogState extends Equatable {
  const AppointmentFormDialogState();
  T? castOrNull<T>() => this is T ? this as T : null;
  @override
  List<Object?> get props => [];
}

class AppointmentFormDialogInitial extends AppointmentFormDialogState {}

class AppointmentFormDialogData extends AppointmentFormDialogState {
  final AppointmentEntity? appointmentEntity;

  const AppointmentFormDialogData({
    required this.appointmentEntity,
  });
  @override
  List<Object?> get props => [appointmentEntity];
}
