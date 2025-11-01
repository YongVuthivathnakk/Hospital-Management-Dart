import 'package:hospital_management_dart/domain/patient.dart';
import 'package:hospital_management_dart/domain/staff.dart';
import 'package:uuid/uuid.dart';

class Appointment {
  String id;
  Staff staff;
  Patient patient;
  String
  time; // use specific time for now such as 10:00am - 11:00 pm, 2:00 pm - 3:00 pm,

  Appointment({
    String? id,
    required this.staff,
    required this.patient,
    required this.time,
  }) : id = id ?? const Uuid().v4();

  @override
  String toString() {
    return '''
📅 Appointment ID: $id
👩‍⚕️ Staff   : ${staff.name} (${staff.position})
🧍 Patient : ${patient.name}
🕒 Time    : $time
''';
  }
}
