import 'package:diario_paciente/utils/app_strings.dart';
import 'package:diario_paciente/utils/utils_extensions.dart';
import 'package:equatable/equatable.dart';

class DayActivityEntity extends Equatable {
  final bool usedMedicine;
  final String? annotations;
  final String? symptom;
  final String? symptomsLevel;
  final DateTime date;

  const DayActivityEntity({
    required this.date,
    this.usedMedicine = false,
    this.annotations,
    this.symptom,
    this.symptomsLevel,
  });

  DayActivityEntity copyWith({
    bool? usedMedicine,
    String? annotations,
    String? symptom,
    String? symptomsLevel,
    DateTime? date,
  }) {
    return DayActivityEntity(
      usedMedicine: usedMedicine ?? this.usedMedicine,
      annotations: annotations ?? this.annotations,
      symptom: symptom ?? this.symptom,
      symptomsLevel: symptomsLevel ?? this.symptomsLevel,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [
        usedMedicine,
        annotations,
        symptom,
        symptomsLevel,
        date,
      ];

  @override
  String toString() {
    String result = '';
    if (symptom != null) {
      result += '${AppStrings.symptom}: $symptom;';
    }

    if (result.isNotEmpty && symptomsLevel != null) {
      result += ' ${AppStrings.symptomLevel}: $symptomsLevel;';
    }

    if (result.isNotEmpty) {
      result += ' ${AppStrings.usedMedicine} ${usedMedicine.toYesNo()};';
    }

    if (annotations != null) {
      result += ' ${AppStrings.annotations}: $annotations';
    }
    return result;
  }

  bool isNotEmpty() {
    if (symptom != null || annotations != null) {
      return true;
    }
    return false;
  }
}
