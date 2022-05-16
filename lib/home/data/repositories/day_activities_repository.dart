import 'package:diario_paciente/home/data/datasources/day_activities_datasource.dart';
import 'package:diario_paciente/home/domain/entities/day_activity_entity.dart';
import 'package:diario_paciente/home/domain/repositories/i_day_activities_repository.dart';

class DayActivitiesRepository implements IDayActivitiesRepository {
  const DayActivitiesRepository({required DayActivitiesDatasource datasource})
      : _datasource = datasource;
  final DayActivitiesDatasource _datasource;
  @override
  Future<List<DayActivityEntity>> loadDayActivities(DateTime date) async {
    return await _datasource.loadDayActivities(date);
  }

  @override
  void saveDayActivity(DayActivityEntity dayActivityEntity) {
    _datasource.saveDayActivity(dayActivityEntity);
  }

  @override
  void deleteDayActivity(DayActivityEntity dayActivityEntity) {
    _datasource.deleteDayActivity(dayActivityEntity);
  }
}
