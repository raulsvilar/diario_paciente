import 'package:diario_paciente/appointments/data/datasources/appointments_datasource.dart';
import 'package:diario_paciente/appointments/data/repositories/appointments_repository.dart';
import 'package:diario_paciente/appointments/domain/repositories/i_appointments_repository.dart';
import 'package:diario_paciente/appointments/domain/usecases/delete_appointment_usecase.dart';
import 'package:diario_paciente/appointments/domain/usecases/load_appointments_usecase.dart';
import 'package:diario_paciente/appointments/domain/usecases/save_appointment_usecase.dart';
import 'package:diario_paciente/home/data/datasources/day_activities_datasource.dart';
import 'package:diario_paciente/home/data/repositories/day_activities_repository.dart';
import 'package:diario_paciente/home/domain/repositories/i_day_activities_repository.dart';
import 'package:diario_paciente/home/domain/usecases/delete_day_activity_usecase.dart';
import 'package:diario_paciente/home/domain/usecases/load_day_activities_usecase.dart';
import 'package:diario_paciente/home/domain/usecases/save_day_activity_usecase.dart';
import 'package:get_it/get_it.dart';

final dependencies = GetIt.instance;

void setupDependencies() {
  dependencies.registerFactory(
    () => DayActivitiesDatasource(),
  );
  dependencies.registerFactory<IDayActivitiesRepository>(
    () => DayActivitiesRepository(
      datasource: dependencies.get(),
    ),
  );
  dependencies.registerFactory(
    () => SaveDayActivitiesUseCase(
      repository: dependencies.get(),
    ),
  );
  dependencies.registerFactory(
    () => LoadDayActivitiesUseCase(
      repository: dependencies.get(),
    ),
  );
  dependencies.registerFactory(
    () => DeleteDayActivityUseCase(
      repository: dependencies.get(),
    ),
  );

  dependencies.registerFactory(
    () => AppointmentsDatasource(),
  );
  dependencies.registerFactory<IAppointmentsRepository>(
    () => AppointmentsRepository(
      datasource: dependencies.get(),
    ),
  );
  dependencies.registerFactory(
    () => SaveAppointmentUseCase(
      repository: dependencies.get(),
    ),
  );
  dependencies.registerFactory(
    () => LoadAppointmentsUseCase(
      repository: dependencies.get(),
    ),
  );
  dependencies.registerFactory(
    () => DeleteAppointmentUseCase(
      repository: dependencies.get(),
    ),
  );
}
