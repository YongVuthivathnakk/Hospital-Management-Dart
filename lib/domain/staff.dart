import 'package:uuid/uuid.dart';

const DOCTOR_BASE_SALARY = 300000.0;
const NUSRE_BASE_SALARY = 96000.0;
const ADMINISTRATIVE_BASE_SALARY = 43000.0;

abstract class Staff {
  final String id;
  final String name;
  double salary;
  String position;

  Staff({required this.name, required this.salary, required this.position})
    : id = Uuid().v4();

  String get getStaffId => id;

  Map<String, dynamic> toJson() => {};

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

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'salary': salary, 'position': position};
  }
}

class Nurse extends Staff {
  Nurse({required super.name})
    : super(position: 'Nurse', salary: NUSRE_BASE_SALARY);

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'salary': salary, 'position': position};
  }
}

class AdministrativePersonnel extends Staff {
  AdministrativePersonnel({required super.name})
    : super(
        position: 'Administrative Personnel',
        salary: ADMINISTRATIVE_BASE_SALARY,
      );

  // Method

  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'salary': salary, 'position': position};
  }
}
