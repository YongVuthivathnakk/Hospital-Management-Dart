import 'dart:convert';
import 'dart:io';

import 'package:hospital_management_dart/data/base_path.dart';
import 'package:hospital_management_dart/domain/appointment/appointment.dart';
import 'package:hospital_management_dart/domain/appointment/appointment_time.dart';

class AppointmentRepository {
  void addAppointment(String doctorId, String patientId, AppointmentTime time) {
    final file = File('$BASE_PATH/appointment/appointments.json');
    file.parent.createSync(recursive: true);

    // ✅ Load existing appointments if file exists
    List<Map<String, dynamic>> appointmentsMap = [];
    if (file.existsSync()) {
      final content = file.readAsStringSync().trim();
      if (content.isNotEmpty) {
        try {
          appointmentsMap = List<Map<String, dynamic>>.from(
            jsonDecode(content),
          );
        } catch (e) {
          print('⚠️ Error reading existing appointments: $e');
        }
      }
    }

    // ✅ Create new appointment (status defaults to scheduled)
    final newAppointment = Appointment(
      staffId: doctorId,
      patientId: patientId,
      time: time,
    );

    // ✅ Convert to JSON
    appointmentsMap.add(newAppointment.toJson());

    // ✅ Save updated list
    file.writeAsStringSync(
      const JsonEncoder.withIndent('  ').convert(appointmentsMap),
    );
  }

  //======READ======
  List<Appointment> getAppointments() {
    final file = File('$BASE_PATH/appointment/appointments.json');
    if (!file.existsSync()) return [];

    final content = file.readAsStringSync().trim();
    if (content.isEmpty) return [];

    final data = jsonDecode(content) as List;

    //Get all related data

    final appointments = data.map((p) => Appointment.fromJson(p)).toList();

    return appointments;
  }
    // void completeAppointment(String appointmentId) {
  //   final appointments = getAppointments();
  //   final appointmentIndex = appointments.indexWhere(
  //     (apt) => apt.id == appointmentId,
  //   );

  //   if (appointmentIndex != -1) {
  //     appointments[appointmentIndex].completeAppointment();
  //     _saveAllAppointments(appointments);
  //     print('✅ Appointment completed!');
  //   } else {
  //     print('❌ Appointment not found!');
  //   }
  // }

  // void cancelAppointment(String appointmentId) {
  //   final appointments = getAppointments();
  //   final appointmentIndex = appointments.indexWhere(
  //     (apt) => apt.id == appointmentId,
  //   );

  //   if (appointmentIndex != -1) {
  //     appointments[appointmentIndex].cancelAppointment();
  //     _saveAllAppointments(appointments);
  //     print('✅ Appointment cancelled!');
  //   } else {
  //     print('❌ Appointment not found!');
  //   }
  // }

  // // DELETE - Remove appointment completely
  // void deleteAppointment(String appointmentId) {
  //   final appointments = getAppointments();
  //   appointments.removeWhere((apt) => apt.id == appointmentId);
  //   _saveAllAppointments(appointments);
  //   print('✅ Appointment deleted!');
  // }

  // // PRIVATE HELPER - Save all appointments to file
  // void _saveAllAppointments(List<Appointment> appointments) {
  //   final file = File('$BASE_PATH/appointment/appointments.json');
  //   final appointmentsMap = appointments.map((apt) => apt.toJson()).toList();

  //   file.writeAsStringSync(
  //     const JsonEncoder.withIndent('  ').convert(appointmentsMap),
  //   );
  // }
}
