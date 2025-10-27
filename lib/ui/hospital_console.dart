import 'dart:io';

import 'package:hospital_management_dart/domain/hospital.dart';
import 'package:hospital_management_dart/domain/staff.dart';

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
          _staffConsole();
          break;
        case '2':
          _roomConsole();
          break;
        case '3':
          _patientConsole();
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
  void _staffConsole() {
    while (true) {
      print('\n=== STAFF MANAGEMENT ===');
      print('1. Add Doctor');
      print('2. Add Nurse');
      print('3. Add Administrative Staff');
      print('4. View All Staff');
      print('5. Back to Main Menu');
      stdout.write('Enter your choice: ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          stdout.write('Enter doctor name: ');
          String name;
          while (true) {
            name = stdin.readLineSync() ?? '';
            if (name == '' || name.isEmpty) {
              print("Name must not be empty!");
            } else {
              break;
            }
          }
          Doctor doctor = Doctor(name: name);
          hospital.addDoctor(doctor);
          print('✅ Doctor "${doctor.name}" created successfully!');
          sleep(const Duration(seconds: 2));
          break;
        case '2':
          stdout.write('Enter nurse name: ');
          String name;
          while (true) {
            name = stdin.readLineSync() ?? '';
            if (name == '' || name.isEmpty) {
              print("Name must not be empty!");
            } else {
              break;
            }
          }
          Nurse nurse = Nurse(name: name);
          hospital.addNurse(nurse);
          print('✅ Nurse "$name" created successfully!');
          sleep(const Duration(seconds: 2));
          break;
        case '3':
          stdout.write('Enter administrative staff name: ');
          String name;
          while (true) {
            name = stdin.readLineSync() ?? '';
            if (name == '' || name.isEmpty) {
              print("Name must not be empty!");
            } else {
              break;
            }
          }

          AdministrativePersonnel administrativePersonnel =
              AdministrativePersonnel(name: name);
          hospital.addAdministrativePersonnel(administrativePersonnel);

          print('✅ Administrative staff "$name" created successfully!');

          sleep(const Duration(seconds: 2));
          break;
        case '4':
          print('\n📋 All Staff Members\n');
          // --- Doctors ---
          var doctors = hospital.getDoctors();

          if (doctors.isNotEmpty) {
            print('👩‍⚕️ Doctors:');
            for (var doctor in hospital.getDoctors()) {
              print(
                '  • ${doctor['name']} (Salary: \$${doctor['salary'].toStringAsFixed(2)})',
              );
            }
            print('');
          }

          //   // --- Nurses ---
          var nurses = hospital.getNurses();
          if (nurses.isNotEmpty) {
            print('👩‍⚕️ Nurses:');
            for (var nurse in nurses) {
              print(
                '  • ${nurse['name']} (Salary: \$${nurse['salary'].toStringAsFixed(2)})',
              );
            }
            print('');
          }

          // --- Administrative Staff ---
          var administrativePersonnels = hospital.getAdministrativePersonnel();
          if (administrativePersonnels.isNotEmpty) {
            print('💼 Administrative Staff:');
            for (var admin in administrativePersonnels) {
              print(
                '  • ${admin['name']} (Salary: \$${admin['salary'].toStringAsFixed(2)})',
              );
            }
            print('');
          }

          sleep(const Duration(seconds: 2));
          break;
        case '5':
          return; // back to main menu
        default:
          print('⚠️ Invalid option. Try again.');
      }
    }
  }

  // -----------------------------
  // ROOM MANAGEMENT (UI only)
  // -----------------------------
  void _roomConsole() {
    while (true) {
      print('\n=== ROOM MANAGEMENT ===');
      print('1. Add Room');
      print('2. Assign Patient to Room');
      print('3. View All Rooms');
      print('4. Back to Main Menu');
      stdout.write('Enter your choice: ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          stdout.write('Enter room number: ');
          final number = stdin.readLineSync() ?? '';
          print('✅ Room "$number" created successfully!');
          sleep(const Duration(seconds: 2));
          break;
        case '2':
          stdout.write('Enter patient name: ');
          final patient = stdin.readLineSync() ?? '';
          stdout.write('Enter room number: ');
          final room = stdin.readLineSync() ?? '';
          print('✅ Assigned "$patient" to room "$room" successfully!');
          sleep(const Duration(seconds: 2));
          break;
        case '3':
          print('📋 Showing all rooms... (placeholder)');
          sleep(const Duration(seconds: 2));
          break;
        case '4':
          return;
        default:
          print('⚠️ Invalid option. Try again.');
      }
    }
  }

  // -----------------------------
  // PATIENT MANAGEMENT (UI only)
  // -----------------------------
  void _patientConsole() {
    while (true) {
      print('\n=== PATIENT MANAGEMENT ===');
      print('1. Add Patient');
      print('2. Schedule Appointment');
      print('3. View All Patients');
      print('4. Back to Main Menu');
      stdout.write('Enter your choice: ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          stdout.write('Enter patient name: ');
          final name = stdin.readLineSync() ?? '';
          print('✅ Patient "$name" created successfully!');
          sleep(const Duration(seconds: 2));
          break;
        case '2':
          stdout.write('Enter patient name: ');
          final patient = stdin.readLineSync() ?? '';
          stdout.write('Enter doctor name: ');
          final doctor = stdin.readLineSync() ?? '';
          print('✅ Appointment scheduled for "$patient" with Dr. "$doctor"!');
          sleep(const Duration(seconds: 2));
          break;
        case '3':
          print('📋 Showing all patients... (placeholder)');
          sleep(const Duration(seconds: 2));
          break;
        case '4':
          return;
        default:
          print('⚠️ Invalid option. Try again.');
      }
    }
  }
}
