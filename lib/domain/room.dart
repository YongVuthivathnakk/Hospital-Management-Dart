import 'package:uuid/uuid.dart';
import 'patient.dart';

class Room {
  final String id;
  final int roomNumber;
  final int capacity;
  final List<Patient> patients;

  Room({
    String? id,
    required this.roomNumber,
    required this.capacity,
    List<Patient>? patients,
  }) : id = id ?? const Uuid().v4(),
       patients = patients ?? [];

  String get roomId => id;

  bool get isFull => patients.length >= capacity;

  void assignPatient(Patient patient) {
    if (isFull) {
      return;
    }
    patients.add(patient);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roomNumber': roomNumber,
      'capacity': capacity,
      'patients': patients.map((p) => p.toJson()).toList(),
    };
  }

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      roomNumber: json['roomNumber'],
      capacity: json['capacity'],
      patients: (json['patients'] as List<dynamic>? ?? [])
          .map((p) => Patient.fromJson(p))
          .toList(),
    );
  }

  @override
  String toString() {
    final current = patients.map((p) => p.name).join(', ');
    return '''
  Room $roomNumber
  ID        : $id
  Capacity  : $capacity
  Occupied  : ${patients.length}/$capacity
  Patients  : ${current.isEmpty ? 'None' : current}
''';
  }
}
