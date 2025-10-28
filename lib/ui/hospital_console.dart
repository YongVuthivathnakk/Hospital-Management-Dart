import 'dart:io';
import 'package:hospital_management_dart/domain/hospital.dart';
import 'package:hospital_management_dart/ui/patient/manage_patient_console.dart';
import 'package:hospital_management_dart/ui/room/manage_room_console.dart';
import 'package:hospital_management_dart/ui/staff/manage_staff_console.dart';

class HospitalConsole {
  final Hospital hospital;

  HospitalConsole({required this.hospital});

  void startConsole() {
    print('🏥 Welcome to Hospital Management System');
    while (true) {
      print('\n=== MAIN MENU ===');
      print('1. Manage Staff');
      print('2. Manage Rooms');
      print('3. Manage Patients');
      print('4. Exit');
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
    ManageStaffConsole console = ManageStaffConsole(hospital: hospital);
    console.start();
  }

  // -----------------------------
  // ROOM MANAGEMENT (UI only)
  // -----------------------------
  void roomConsole() {
    ManageRoomConsole console = ManageRoomConsole(hospital: hospital);
    console.start();
  }

  // -----------------------------
  // PATIENT MANAGEMENT (UI only)
  // -----------------------------
  void patientConsole() {
    ManagePatientConsole console = ManagePatientConsole(hospital: hospital);
    console.start();
  }
}
