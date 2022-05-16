import 'package:diario_paciente/config/dependency_injection.dart';
import 'package:diario_paciente/config/hive_config.dart';
import 'package:diario_paciente/config/notifications_config.dart';
import 'package:diario_paciente/home/presentation/cubits/list_day_activities/list_day_activities_cubit.dart';
import 'package:diario_paciente/home/presentation/list_day_activities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  setupDependencies();
  HiveConfig.setup();
  await NotificationsConfig.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diário do Paciente',
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('pt', 'BR')],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ListDayActivitiesCubit(
          saveDayActivitiesUseCase: dependencies.get(),
          loadDayActivitiesUseCase: dependencies.get(),
          deleteDayActivityUseCase: dependencies.get(),
        ),
        child: const ListDayActivities(),
      ),
    );
  }
}
