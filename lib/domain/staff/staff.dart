import 'package:uuid/uuid.dart';

const DOCTOR_BASE_SALARY = 300000.0;
const NUSRE_BASE_SALARY = 96000.0;
const ADMINISTRATIVE_BASE_SALARY = 43000.0;

abstract class Staff {
  final String id;
  final String name;
  final String gender;
  double _salary;
  String position;

  Staff({
    String? id,
    required this.name,
    required this.gender,
    double? salary,
    String? position,
  }) : id = id ?? Uuid().v4(),
       position = position ?? '',
       _salary = salary ?? 0;

  String get getStaffId => id;
  double get salary => _salary;
  Map<String, dynamic> toJson() => {};

  @override
  String toString() {
    return '👤 Name: $name | Gender: $gender | Salary: $salary | ID: $id';
  }
}

// ======== Doctor ========

class Doctor extends Staff {
  Doctor({super.id, required super.name, required super.gender, double? salary})
    : super(position: 'Doctor', salary: salary ?? DOCTOR_BASE_SALARY);

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      salary: (json['salary'] ?? DOCTOR_BASE_SALARY).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'salary': salary,
      'position': position,
    };
  }
}

// ======= NURSE ======

class Nurse extends Staff {
  Nurse({super.id, required super.name, required super.gender, double? salary})
    : super(position: 'Nurse', salary: salary ?? NUSRE_BASE_SALARY);

  factory Nurse.fromJson(Map<String, dynamic> json) {
    return Nurse(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      salary: (json['salary'] ?? NUSRE_BASE_SALARY).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'salary': salary,
      'position': position,
    };
  }
}

class AdministrativePersonnel extends Staff {
  AdministrativePersonnel({
    super.id,
    required super.name,
    required super.gender,
    double? salary,
  }) : super(
         position: 'Administrative Personnel',
         salary: salary ?? ADMINISTRATIVE_BASE_SALARY,
       );

  factory AdministrativePersonnel.fromJson(Map<String, dynamic> json) {
    return AdministrativePersonnel(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      salary: (json['salary'] ?? ADMINISTRATIVE_BASE_SALARY).toDouble(),
    );
  }

  // Method

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'salary': salary,
      'position': position,
    };
  }
}
