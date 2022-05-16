import 'package:diario_paciente/home/domain/entities/day_activity_entity.dart';

abstract class IDayActivitiesRepository {
  void saveDayActivity(DayActivityEntity dayActivityEntity);
  Future<List<DayActivityEntity>> loadDayActivities(DateTime date);
  void deleteDayActivity(DayActivityEntity dayActivityEntity) {}
}
