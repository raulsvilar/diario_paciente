import 'package:diario_paciente/home/domain/entities/day_activity_entity.dart';
import 'package:diario_paciente/home/domain/repositories/i_day_activities_repository.dart';

class DeleteDayActivityUseCase {
  const DeleteDayActivityUseCase({required IDayActivitiesRepository repository})
      : _repository = repository;
  final IDayActivitiesRepository _repository;

  void call(DayActivityEntity dayActivityEntity) {
    return _repository.deleteDayActivity(dayActivityEntity);
  }
}
