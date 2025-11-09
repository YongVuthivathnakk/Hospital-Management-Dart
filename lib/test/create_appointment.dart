import 'dart:math';

import 'package:hospital_management_dart/data/appointment/appointment_repository.dart';
import 'package:hospital_management_dart/domain/appointment/appointment.dart';
import 'package:hospital_management_dart/domain/appointment/appointment_time.dart';
import 'package:hospital_management_dart/domain/patient/patient.dart';
import 'package:hospital_management_dart/domain/staff/staff.dart';
import 'package:test/test.dart';

void main() {
  group('AppointmentRepository', () {
    late AppointmentRepository appointmentRepository;
    setUp(() {
      appointmentRepository = AppointmentRepository();
      
    });


    test("get appointment should return all the appointments", () {
      final doctor1 = Doctor(id: "d1", name: "Doc A", gender: "Male");
      final doctor2 = Doctor(id: "d2", name: "Doc B", gender: "Male");
      final patient1 = Patient(id: "p1", name: "P. A", gender: "Male", age: 20);
      final patient2 = Patient(id: "p2", name: "P. B", gender: "Female", age: 21);


      final appointment1 = Appointment(staffId: doctor1.id, patientId: patient1.id, time: AppointmentTime.morning);
      final appointment2 = Appointment(staffId: doctor2.id, patientId: patient2.id, time: AppointmentTime.afternoon);


      appointmentRepository.addAppointment(appointment1);
      appointmentRepository.addAppointment(appointment2);

      final appointments = appointmentRepository.getAppointments();

      expect(appointments.length, 2);
      expect(appointments[0].staffId, 'd1');
      expect(appointments[0].patientId, 'p1');
      expect(appointments[1].staffId, 'd2');
      expect(appointments[1].patientId, 'p2');

    });
  });

}