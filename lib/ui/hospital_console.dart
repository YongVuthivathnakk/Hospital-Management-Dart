import 'dart:io';
import 'package:hospital_management_dart/data/admin/admin_repository.dart';
import 'package:hospital_management_dart/data/appointment/appointment_repository.dart';
import 'package:hospital_management_dart/data/doctor/doctor_repository.dart';
import 'package:hospital_management_dart/data/nurse/nurse_repository.dart';
import 'package:hospital_management_dart/data/patient/patient_repository.dart';
import 'package:hospital_management_dart/data/room/room_repository.dart';

import '../ui/appointment/manage_appointment_console.dart';
import '../ui/patient/manage_patient_console.dart';
import '../ui/room/manage_room_console.dart';
import '../ui/staff/manage_staff_console.dart';


class HospitalConsole {
  final AdminRepository adminRepository;
  final DoctorRepository doctorRepository;
  final NurseRepository nurseRepository;
  final PatientRepository patientRepository;
  final RoomRepository roomRepository;
  final AppointmentRepository appointmentRepository;
  HospitalConsole({required this.adminRepository, required this.doctorRepository, required this.nurseRepository, required this.patientRepository, required this.roomRepository, required this.appointmentRepository});

  void startConsole() {
    print('🏥 Welcome to Hospital Management System');
    while (true) {
      print('\n=== MAIN MENU ===');
      print('1. Manage Staff');
      print('2. Manage Rooms');
      print('3. Manage Patients');
      print('4. Manage Appointments');
      print('5. Exit');
      stdout.write('Enter your choice: ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          staffConsole();
          break;
        case '2':
          roomConsole();
          break;
        case '3':
          patientConsole();
          break;
        case '4':
          appointmentConsole();
          break;
        case '5':
          print('👋 Exiting system... Goodbye!');
          return;
        default:
          print('⚠️ Invalid choice. Please try again.');
      }
    }
  }

  // -----------------------------
  // STAFF MANAGEMENT (UI only)
  // -----------------------------
  void staffConsole() {
    ManageStaffConsole console = ManageStaffConsole(adminRepository: adminRepository, doctorRepository: doctorRepository, nurseRepository: nurseRepository);
    console.start();
  }

  // -----------------------------
  // ROOM MANAGEMENT (UI only)
  // -----------------------------
  void roomConsole() {
    ManageRoomConsole console = ManageRoomConsole(roomRepository: roomRepository, patientRepository: patientRepository );
    console.start();
  }

  // -----------------------------
  // PATIENT MANAGEMENT (UI only)
  // -----------------------------
  void patientConsole() {
    ManagePatientConsole console = ManagePatientConsole(patientRepository: patientRepository);
    console.start();
  }

  // -----------------------------
  // APPOINTMENT MANAGEMENT (UI only)
  // -----------------------------
  void appointmentConsole() {
    ManageAppointmentConsole console = ManageAppointmentConsole(appointmentRepository: appointmentRepository, patientRepository: patientRepository, doctorRepository: doctorRepository );
    console.start();
  }
}
