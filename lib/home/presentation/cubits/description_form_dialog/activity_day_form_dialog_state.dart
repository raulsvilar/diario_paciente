part of 'activity_day_form_dialog_cubit.dart';

abstract class ActivityDayFormDialogState extends Equatable {
  const ActivityDayFormDialogState();
  @override
  List<Object?> get props => [];

  T? castOrNull<T>() => this is T ? this as T : null;
}

class ActivityDayFormDialogInitial extends ActivityDayFormDialogState {}

class ActivityDayFormDialogData extends ActivityDayFormDialogState {
  final DayActivityEntity? dayActivityEntity;

  const ActivityDayFormDialogData({
    required this.dayActivityEntity,
  });
  @override
  List<Object?> get props => [dayActivityEntity];
}
