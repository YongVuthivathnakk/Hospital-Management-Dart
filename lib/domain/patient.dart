import 'package:uuid/uuid.dart';

class Patient {
  final String id;
  final String name;
  int age;
  String gender;

  Patient({required this.name, required this.age, required this.gender})
    : id = const Uuid().v4();

  @override
  String toString() =>
      '👤 Patient: $name | Age: $age | Gender: $gender | ID: $id';
}
