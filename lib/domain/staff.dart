import 'package:uuid/uuid.dart';

const DOCTOR_BASE_SALARY = 300000.0;
const NUSRE_BASE_SALARY = 96000.0;
const ADMINISTRATIVE_BASE_SALARY = 43000.0;

abstract class Staff {
  final String id;
  final String name;
  double salary;
  final String position;

  Staff({required this.name, required this.salary, required this.position})
    : id = Uuid().v4();

  String get getStaffId => id;

  @override
  String toString() {
    return '''
🧾 Staff Info:
  ID        : $id
  Name      : $name
  Position  : $position
  Salary    : \$${salary.toStringAsFixed(2)}
  ''';
  }
}

class Doctor extends Staff {
  Doctor({required super.name})
    : super(position: 'Doctor', salary: DOCTOR_BASE_SALARY);
}

class Nurse extends Staff {
  Nurse({required super.name})
    : super(position: 'Nurse', salary: NUSRE_BASE_SALARY);
}

class AdministrativePersonnel extends Staff {
  AdministrativePersonnel({required super.name})
    : super(position: 'Doctor', salary: ADMINISTRATIVE_BASE_SALARY);
}

void main() {
  final doctor = Doctor(name: "Dr. Lina");
  final nurse = Nurse(name: "Sokha");
  final admin = AdministrativePersonnel(name: "Dara");

  print(doctor);
  print(nurse);
  print(admin);
}
