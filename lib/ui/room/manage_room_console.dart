import 'dart:io';

import 'package:hospital_management_dart/ui/console.dart';

class ManageRoomConsole extends Console {
  ManageRoomConsole({required super.hospital});

  @override
  void start() {
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
}
