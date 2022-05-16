import 'package:diario_paciente/appointments/presentation/appointments_screen.dart';
import 'package:diario_paciente/appointments/presentation/cubits/appointments_screen/appointments_screen_cubit.dart';
import 'package:diario_paciente/config/dependency_injection.dart';
import 'package:diario_paciente/home/presentation/cubits/list_day_activities/list_day_activities_cubit.dart';
import 'package:diario_paciente/home/presentation/list_day_activities.dart';
import 'package:diario_paciente/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerMenus extends StatelessWidget {
  const DrawerMenus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
                child: Text(
              AppStrings.myDiary,
              style: TextStyle(fontSize: 40),
            )),
          ),
          ListTile(
            title: const Text(AppStrings.home),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => BlocProvider(
                    create: (context) => ListDayActivitiesCubit(
                      saveDayActivitiesUseCase: dependencies.get(),
                      loadDayActivitiesUseCase: dependencies.get(),
                      deleteDayActivityUseCase: dependencies.get(),
                    ),
                    child: const ListDayActivities(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(AppStrings.appointments),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => BlocProvider(
                    create: (context) => AppointmentsScreenCubit(
                      loadAppointmentsUseCase: dependencies.get(),
                      saveAppointmentUseCase: dependencies.get(),
                      deleteAppointmentUseCase: dependencies.get(),
                    ),
                    child: const AppointmentsScreen(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
