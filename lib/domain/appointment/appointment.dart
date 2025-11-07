import 'package:hospital_management_dart/domain/appointment/appointment_time.dart';
//import 'package:hospital_management_dart/domain/patient.dart';
//import 'package:hospital_management_dart/domain/staff.dart';
import 'package:uuid/uuid.dart';

class Appointment {
  String id;
  String staffId;
  String patientId;
  AppointmentTime
  time; // use specific time for now such as 10:00am - 11:00 pm, 2:00 pm - 3:00 pm,

  Appointment({
    String? id,
    required this.staffId,
    required this.patientId,
    required this.time,
  }) : id = id ?? const Uuid().v4();

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'] as String,
      time: AppointmentTime.values.byName(json['time'] as String),
      staffId: json['staffId'] as String,
      patientId: json['patientId'] as String,
    );
  }

  @override
  String toString() {
    return '''
📅 Appointment ID: $id
👩‍⚕️ Staff ID   : ${staffId}
🧍 Patient ID: ${patientId}
🕒 Time    : ${time.name}
''';
  }

  // Add this to your Appointment class in appointment.dart
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'staffId': staffId,
      'patientId': patientId,
      'time': time.name,
    };
  }
}
