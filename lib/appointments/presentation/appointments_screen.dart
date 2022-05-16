import 'package:diario_paciente/appointments/domain/entities/appointment_entity.dart';
import 'package:diario_paciente/appointments/presentation/appointment_form_dialog.dart';
import 'package:diario_paciente/appointments/presentation/cubits/appointment_form_dialog/appointment_form_dialog_cubit.dart';
import 'package:diario_paciente/appointments/presentation/cubits/appointments_screen/appointments_screen_cubit.dart';
import 'package:diario_paciente/ui/drawer_menu.dart';
import 'package:diario_paciente/ui/list_item.dart';
import 'package:diario_paciente/utils/app_strings.dart';
import 'package:diario_paciente/utils/utils_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  late final AppointmentsScreenCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<AppointmentsScreenCubit>();
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsScreenCubit, AppointmentsScreenState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                '${AppStrings.appointments} - ${state.date.toSlashedDate()}',
              ),
              actions: [
                IconButton(
                    icon: const Icon(Icons.date_range),
                    onPressed: _showDatePicker),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final result = await showDialog<AppointmentEntity>(
                  context: context,
                  builder: (_) => BlocProvider(
                    create: (context) => AppointmentFormDialogCubit(),
                    child: AppointmentFormDialog(
                      date: state.date,
                    ),
                  ),
                );
                _cubit.addAppointment(result);
              },
              tooltip: 'Add',
              child: const Icon(Icons.add),
            ),
            drawer: const DrawerMenus(),
            body: state is AppointmentsLoading
                ? const Center(child: CircularProgressIndicator())
                : _listDayActivities(
                    state.castOrNull<AppointmentsLoaded>()?.listAppointments),
          ),
        );
      },
    );
  }

  Widget _listDayActivities(List<AppointmentEntity>? list) {
    if (list != null) {
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) => ListItem(
              onTapped: () {},
              onPressedDelete: () => _cubit.deleteAppointment(list[index]),
              time: TimeOfDay.fromDateTime(list[index].date),
              subtitle: list[index].toString()));
    } else {
      return Container();
    }
  }

  void _showDatePicker() async {
    _cubit.changeDate(await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ));
  }
}
