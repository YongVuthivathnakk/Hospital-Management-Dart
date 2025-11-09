import 'package:hospital_management_dart/data/appointment/appointment_repository.dart';
import 'package:hospital_management_dart/domain/appointment/appointment_time.dart';

class Hospital {
  bool isStaffAvailable(String staffId, AppointmentTime time) {
    
    final appoitnments = AppointmentRepository().getAppointments();

    final conflictAppointment = appoitnments.any((appoitnment) => appoitnment.staffId == staffId && appoitnment.time == time);

    return conflictAppointment;
  }
}

