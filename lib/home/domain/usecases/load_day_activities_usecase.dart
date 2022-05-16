import 'package:diario_paciente/home/domain/entities/day_activity_entity.dart';
import 'package:diario_paciente/home/domain/repositories/i_day_activities_repository.dart';

class LoadDayActivitiesUseCase {
  const LoadDayActivitiesUseCase({required IDayActivitiesRepository repository})
      : _repository = repository;
  final IDayActivitiesRepository _repository;

  Future<List<DayActivityEntity>> call(DateTime date) {
    return _repository.loadDayActivities(date);
  }
}
