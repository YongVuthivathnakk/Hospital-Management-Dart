import 'package:uuid/uuid.dart';
import 'patient.dart';

class Room {
  final String id;
  final String roomNumber;
  final int capacity;
  final List<Patient> patients = [];

  Room({required this.roomNumber, this.capacity = 1}) : id = const Uuid().v4();

  // Assign a patient if space is available
  bool assignPatient(Patient patient) {
    if (patients.length >= capacity) {
      print('⚠️ Room $roomNumber is full! Cannot assign ${patient.name}.');
      return false;
    }
    patients.add(patient);
    print('✅ ${patient.name} assigned to Room $roomNumber successfully.');
    return true;
  }

  // Remove patient from room
  void removePatient(String patientId) {
    patients.removeWhere((p) => p.id == patientId);
    print('🧹 Removed patient with ID $patientId from Room $roomNumber.');
  }

  List<Patient> get patientsList => List.unmodifiable(patients);

  bool get isFull => patients.length >= capacity;

  @override
  String toString() {
    final current = patients.map((p) => p.name).join(', ');
    return '''
🏠 Room $roomNumber
  ID        : $id
  Capacity  : $capacity
  Occupied  : ${patients.length}/$capacity
  Patients  : ${current.isEmpty ? 'None' : current}
''';
  }
}
