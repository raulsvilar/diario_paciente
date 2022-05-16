part of 'list_day_activities_cubit.dart';

abstract class ListDayActivitiesState extends Equatable {
  const ListDayActivitiesState(this.date);

  final DateTime date;

  T? castOrNull<T>() => this is T ? this as T : null;

  @override
  List<Object> get props => [date];
}

class ListDayActivitiesInitial extends ListDayActivitiesState {
  const ListDayActivitiesInitial(DateTime date) : super(date);
}

class ListDayActivitiesLoading extends ListDayActivitiesState {
  const ListDayActivitiesLoading(DateTime date) : super(date);
}

class ListDayActivitiesLoaded extends ListDayActivitiesState {
  final List<DayActivityEntity> listDayActivity;

  const ListDayActivitiesLoaded(
      {required DateTime date, required this.listDayActivity})
      : super(date);

  @override
  List<Object> get props => [...super.props, listDayActivity];
}
