import 'package:diario_paciente/home/domain/entities/day_activity_entity.dart';
import 'package:diario_paciente/home/presentation/cubits/description_form_dialog/activity_day_form_dialog_cubit.dart';
import 'package:diario_paciente/home/utils/symptoms_level_enum.dart';
import 'package:diario_paciente/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityDayFormDialog extends StatefulWidget {
  final DateTime date;
  final DayActivityEntity? dayActivityEntity;
  const ActivityDayFormDialog({
    Key? key,
    required this.date,
    this.dayActivityEntity,
  }) : super(key: key);

  @override
  State<ActivityDayFormDialog> createState() => _ActivityDayFormDialogState();
}

class _ActivityDayFormDialogState extends State<ActivityDayFormDialog> {
  late final ActivityDayFormDialogCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ActivityDayFormDialogCubit>();
    _cubit.init(
      date: widget.date,
      dayActivityEntity: widget.dayActivityEntity,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityDayFormDialogCubit, ActivityDayFormDialogState>(
      builder: (context, state) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  readOnly: widget.dayActivityEntity != null,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText:
                        widget.dayActivityEntity?.symptom ?? AppStrings.symptom,
                  ),
                  onChanged: (value) => _cubit.setSymptom(value),
                  keyboardType: TextInputType.text,
                ),
                DropdownButton<SymptomsLevelEnum>(
                  isExpanded: true,
                  hint: const Text(AppStrings.symptomLevel),
                  value: state
                      .castOrNull<ActivityDayFormDialogData>()
                      ?.dayActivityEntity
                      ?.symptomsLevel
                      ?.toSymptomsLevelEnum(),
                  items: const [
                    DropdownMenuItem(
                      child: Text(
                        AppStrings.severe,
                      ),
                      value: SymptomsLevelEnum.severe,
                    ),
                    DropdownMenuItem(
                      child: Text(
                        AppStrings.moderate,
                      ),
                      value: SymptomsLevelEnum.moderate,
                    ),
                    DropdownMenuItem(
                      child: Text(
                        AppStrings.mild,
                      ),
                      value: SymptomsLevelEnum.mild,
                    ),
                  ],
                  onChanged: widget.dayActivityEntity == null
                      ? (value) => _cubit.changeSymptomsLevel(value)
                      : null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(AppStrings.usedMedicine),
                    Checkbox(
                        value: state
                                .castOrNull<ActivityDayFormDialogData>()
                                ?.dayActivityEntity
                                ?.usedMedicine ??
                            false,
                        onChanged: widget.dayActivityEntity == null
                            ? (value) =>
                                _cubit.changeUsedMedicine(value ?? false)
                            : null),
                  ],
                ),
                TextField(
                  readOnly: widget.dayActivityEntity != null,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: widget.dayActivityEntity?.annotations ??
                          AppStrings.annotations),
                  maxLines: null,
                  keyboardType: TextInputType.text,
                  //placeholder: HomeStrings.annotations,
                  onChanged: (value) => _cubit.setAnnotations(value),
                ),
                if (widget.dayActivityEntity == null)
                  TextButton(
                    onPressed: () {
                      final dayActivityEntity = state
                          .castOrNull<ActivityDayFormDialogData>()
                          ?.dayActivityEntity;
                      if (dayActivityEntity != null &&
                          dayActivityEntity.isNotEmpty()) {
                        return Navigator.of(context).pop(dayActivityEntity);
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
