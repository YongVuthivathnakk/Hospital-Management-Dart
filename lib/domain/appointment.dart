import '../domain/patient.dart';
import '../domain/staff.dart';
import 'room.dart';
//import 'package:hospital_management_dart/domain/patient.dart';
//import 'package:hospital_management_dart/domain/staff.dart';
import 'package:uuid/uuid.dart';

enum AppointmentStatus { scheduled, completed, cancelled, rescheduled }
class Appointment {
  String id;
  Staff staff;
  Patient patient;
  String
  time; // use specific time for now such as 10:00am - 11:00 pm, 2:00 pm - 3:00 pm,
  final Room room;
  final DateTime appointmentTime;
  final String purpose;
  AppointmentStatus status;
  //final Duration duration;

  Appointment({
    String? id,
    required this.staff,
    required this.patient,
    required this.time,
    required this.room,
    required this.appointmentTime,
    required this.purpose,
    this.status = AppointmentStatus.scheduled,
  }) : id = id ?? const Uuid().v4();

  void completeAppointment() {
    status = AppointmentStatus.completed;
  }

  void cancelAppointment(){
    status = AppointmentStatus.cancelled;
  }

  void rescheduledAppointment(DateTime newTime, String newTimeSlot){
    time = newTimeSlot;
    status = AppointmentStatus.rescheduled;
  }

  @override
  String toString() {
    return '''
📅 Appointment ID: $id
👩‍⚕️ Staff   : ${staff.name} (${staff.position})
🧍 Patient : ${patient.name}
🕒 Time    : $time
📅 Date : ${appointmentTime.toString().split(' ')[0]}
🏥 Room : ${room.roomNumber} (${room.roomId})
📝 Purpose : $purpose
📊 Status : ${status.toString().split('.').last}
''';
  }

  // Add this to your Appointment class in appointment.dart
Map<String, dynamic> toJson() {
  return {
    'id': id,
    'staffId': staff.id,
    'patientId': patient.id,
    'time': time,
    'roomId': room.id,
    'appointmentTime': appointmentTime.toIso8601String(),
    'purpose': purpose,
    'status': status.toString().split('.').last, // Store as string
  };
}
}
