import 'package:diario_paciente/utils/app_strings.dart';
import 'package:equatable/equatable.dart';

class AppointmentEntity extends Equatable {
  final DateTime date;
  final String? name;
  final String? description;

  const AppointmentEntity({
    required this.date,
    this.name,
    this.description,
  });

  @override
  List<Object?> get props => [date, name, description];

  AppointmentEntity copyWith({
    DateTime? date,
    String? name,
    String? description,
  }) {
    return AppointmentEntity(
      date: date ?? this.date,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    String result = '';
    if (name != null) {
      result += '${AppStrings.name}: $name;';
    }
    if (description != null) {
      result += ' ${AppStrings.description}: $description;';
    }
    return result;
  }

  bool isNotEmpty() {
    if (name != null) {
      return true;
    }
    return false;
  }
}
