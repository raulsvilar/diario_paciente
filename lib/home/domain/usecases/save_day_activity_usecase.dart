import 'package:diario_paciente/home/domain/entities/day_activity_entity.dart';
import 'package:diario_paciente/home/domain/repositories/i_day_activities_repository.dart';

class SaveDayActivitiesUseCase {
  const SaveDayActivitiesUseCase({required IDayActivitiesRepository repository})
      : _repository = repository;
  final IDayActivitiesRepository _repository;

  call(DayActivityEntity entity) {
    _repository.saveDayActivity(entity);
  }
}
