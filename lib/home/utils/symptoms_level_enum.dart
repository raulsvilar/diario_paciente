import 'package:diario_paciente/utils/app_strings.dart';

enum SymptomsLevelEnum { mild, moderate, severe }

extension SymptomsLevelEnumExt on SymptomsLevelEnum {
  String get name {
    switch (this) {
      case SymptomsLevelEnum.mild:
        return AppStrings.mild;
      case SymptomsLevelEnum.moderate:
        return AppStrings.moderate;
      case SymptomsLevelEnum.severe:
        return AppStrings.severe;
    }
  }
}

extension StringToSymptomsLevelEnumExt on String {
  SymptomsLevelEnum toSymptomsLevelEnum() {
    return SymptomsLevelEnum.values
        .firstWhere((element) => element.name == this);
  }
}
