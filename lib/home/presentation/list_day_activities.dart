import 'package:diario_paciente/home/domain/entities/day_activity_entity.dart';
import 'package:diario_paciente/home/presentation/activity_day_form_dialog.dart';
import 'package:diario_paciente/home/presentation/cubits/description_form_dialog/activity_day_form_dialog_cubit.dart';
import 'package:diario_paciente/home/presentation/cubits/list_day_activities/list_day_activities_cubit.dart';
import 'package:diario_paciente/ui/drawer_menu.dart';
import 'package:diario_paciente/ui/list_item.dart';
import 'package:diario_paciente/utils/utils_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListDayActivities extends StatefulWidget {
  const ListDayActivities({Key? key}) : super(key: key);

  @override
  State<ListDayActivities> createState() => _ListDayActivitiesState();
}

class _ListDayActivitiesState extends State<ListDayActivities> {
  late final ListDayActivitiesCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ListDayActivitiesCubit>();
    _cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDayActivitiesCubit, ListDayActivitiesState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(state.date.toSlashedDate()),
              actions: [
                IconButton(
                    icon: const Icon(Icons.date_range),
                    onPressed: _showDatePicker),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final result = await showDialog<DayActivityEntity>(
                  context: context,
                  builder: (_) => BlocProvider(
                    create: (context) => ActivityDayFormDialogCubit(),
                    child: ActivityDayFormDialog(
                      date: state.date,
                    ),
                  ),
                );
                _cubit.addDayActivity(result);
              },
              tooltip: 'Add',
              child: const Icon(Icons.add),
            ),
            drawer: const DrawerMenus(),
            body: state is ListDayActivitiesLoading
                ? const Center(child: CircularProgressIndicator())
                : _listDayActivities(state
                    .castOrNull<ListDayActivitiesLoaded>()
                    ?.listDayActivity),
          ),
        );
      },
    );
  }

  Widget _listDayActivities(List<DayActivityEntity>? list) {
    if (list != null) {
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) => ListItem(
              onTapped: () => showDialog<DayActivityEntity>(
                    context: context,
                    builder: (_) => BlocProvider(
                      create: (context) => ActivityDayFormDialogCubit(),
                      child: ActivityDayFormDialog(
                        date: list[index].date,
                        dayActivityEntity: list[index],
                      ),
                    ),
                  ),
              onPressedDelete: () => _cubit.deleteDayActivity(list[index]),
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
