import 'dart:io';

import 'package:hospital_management_dart/ui/console.dart';

class ManagePatientConsole extends Console {
  ManagePatientConsole({required super.hospital});

  @override
  void start() {
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
