import 'dart:io';
import 'dart:isolate';

import 'package:hospital_management_dart/ui/console.dart';

class ManageAppointmentConsole extends Console {
  ManageAppointmentConsole({required super.hospital});

  @override
  void start() {
    print('\n📅 Appointment Management Console');

    while (true) {
      print('\n=== Appointment Menu ===');
      print('1. Create Appointment');
      print('2. View All Appointments');
      print('3. Back to Main Menu');
      stdout.write('Enter your choice: ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          createAppointment();
          break;
        case '2':
          viewAllAppointments();
          break;
        case '3':
          return;
        default:
          print('⚠️ Invalid choice. Try again.');
      }
    }
  }

  void viewAllAppointments() {
    print('📋 Showing all appointments... (placeholder)');
    sleep(const Duration(seconds: 2));
  }

  void createAppointment() {
    stdout.write('Enter patient name: ');
    final patient = stdin.readLineSync() ?? '';
    stdout.write('Enter doctor name: ');
    final doctor = stdin.readLineSync() ?? '';
    print('✅ Appointment scheduled for "$patient" with Dr. "$doctor"!');
    sleep(const Duration(seconds: 2));
  }
}
