import 'package:diario_paciente/utils/app_strings.dart';

extension DateTimeExt on DateTime {
  String toSlashedDate() =>
      '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
  String onlyDateString() =>
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
}

extension BoolExt on bool {
  String toYesNo() {
    return this ? AppStrings.yes : AppStrings.no;
  }
}
