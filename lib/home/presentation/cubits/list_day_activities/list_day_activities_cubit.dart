import 'package:bloc/bloc.dart';
import 'package:diario_paciente/home/domain/entities/day_activity_entity.dart';
import 'package:diario_paciente/home/domain/usecases/delete_day_activity_usecase.dart';
import 'package:diario_paciente/home/domain/usecases/load_day_activities_usecase.dart';
import 'package:diario_paciente/home/domain/usecases/save_day_activity_usecase.dart';
import 'package:equatable/equatable.dart';

part 'list_day_activities_state.dart';

class ListDayActivitiesCubit extends Cubit<ListDayActivitiesState> {
  ListDayActivitiesCubit({
    required LoadDayActivitiesUseCase loadDayActivitiesUseCase,
    required SaveDayActivitiesUseCase saveDayActivitiesUseCase,
    required DeleteDayActivityUseCase deleteDayActivityUseCase,
  })  : _loadDayActivitiesUseCase = loadDayActivitiesUseCase,
        _saveDayActivitiesUseCase = saveDayActivitiesUseCase,
        _deleteDayActivityUseCase = deleteDayActivityUseCase,
        super(ListDayActivitiesInitial(DateTime.now()));

  final LoadDayActivitiesUseCase _loadDayActivitiesUseCase;
  final SaveDayActivitiesUseCase _saveDayActivitiesUseCase;
  final DeleteDayActivityUseCase _deleteDayActivityUseCase;

  void init() async {
    emit(ListDayActivitiesLoading(state.date));
    emit(ListDayActivitiesLoaded(
      date: state.date,
      listDayActivity: await _loadDayActivitiesUseCase(state.date),
    ));
  }

  void changeDate(DateTime? date) async {
    emit(ListDayActivitiesLoading(date ?? state.date));
    emit(ListDayActivitiesLoaded(
      date: state.date,
      listDayActivity: await _loadDayActivitiesUseCase(state.date),
    ));
  }

  void addDayActivity(DayActivityEntity? dayActivityEntity) async {
    if (dayActivityEntity != null) {
      emit(ListDayActivitiesLoading(state.date));
      _saveDayActivitiesUseCase(dayActivityEntity);
      emit(ListDayActivitiesLoaded(
        date: state.date,
        listDayActivity: await _loadDayActivitiesUseCase(state.date),
      ));
    }
  }

  deleteDayActivity(DayActivityEntity dayActivityEntity) async {
    emit(ListDayActivitiesLoading(state.date));
    _deleteDayActivityUseCase(dayActivityEntity);
    emit(ListDayActivitiesLoaded(
      date: state.date,
      listDayActivity: await _loadDayActivitiesUseCase(state.date),
    ));
  }
}
