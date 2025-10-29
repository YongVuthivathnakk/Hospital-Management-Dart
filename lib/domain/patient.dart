import 'package:uuid/uuid.dart';

class Patient {
  final String id;
  final String name;
  final String gender;
  final int age;

  Patient({
    String? id,
    required this.name,
    required this.gender,
    required this.age,
  }) : id = id ?? const Uuid().v4();

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      gender: json['gender'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'gender': gender, 'age': age};
  }

  @override
  String toString() =>
      '👤 Patient: $name | Age: $age | Gender: $gender | ID: $id';
}
