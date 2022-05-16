import 'package:diario_paciente/appointments/domain/entities/appointment_entity.dart';
import 'package:diario_paciente/appointments/presentation/cubits/appointment_form_dialog/appointment_form_dialog_cubit.dart';
import 'package:diario_paciente/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentFormDialog extends StatefulWidget {
  final DateTime date;
  final AppointmentEntity? appointmentEntity;
  const AppointmentFormDialog({
    Key? key,
    required this.date,
    this.appointmentEntity,
  }) : super(key: key);

  @override
  State<AppointmentFormDialog> createState() => _AppointmentFormDialogState();
}

class _AppointmentFormDialogState extends State<AppointmentFormDialog> {
  late final AppointmentFormDialogCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<AppointmentFormDialogCubit>();
    _cubit.init(
      date: widget.date,
      appointmentEntity: widget.appointmentEntity,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentFormDialogCubit, AppointmentFormDialogState>(
      builder: (context, state) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  readOnly: widget.appointmentEntity != null,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: widget.appointmentEntity?.name ?? AppStrings.name,
                  ),
                  onChanged: (value) => _cubit.setName(value),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  readOnly: widget.appointmentEntity != null,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.appointmentEntity?.description ??
                          AppStrings.description),
                  maxLines: null,
                  keyboardType: TextInputType.text,
                  //placeholder: HomeStrings.annotations,
                  onChanged: (value) => _cubit.setDescription(value),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('${AppStrings.time}: ${TimeOfDay.fromDateTime(
                    state
                            .castOrNull<AppointmentFormDialogData>()
                            ?.appointmentEntity
                            ?.date ??
                        DateTime.now(),
                  ).format(context)}'),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.alarm_add,
                      color: Colors.green,
                    ),
                    onPressed: () async {
                      _cubit.setTime(
                        await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now()) ??
                            TimeOfDay.now(),
                      );
                    },
                  ),
                ),
                if (widget.appointmentEntity == null)
                  TextButton(
                    onPressed: () {
                      final appointmentEntity = state
                          .castOrNull<AppointmentFormDialogData>()
                          ?.appointmentEntity;
                      if (appointmentEntity != null &&
                          appointmentEntity.isNotEmpty()) {
                        return Navigator.of(context).pop(appointmentEntity);
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text(AppStrings.save),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
