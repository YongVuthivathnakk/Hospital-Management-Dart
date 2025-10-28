import 'dart:io';

import 'package:hospital_management_dart/domain/hospital.dart';
import 'package:hospital_management_dart/domain/staff.dart';

class ManageStaffConsole {
  Hospital hospital;

  ManageStaffConsole({required this.hospital});

  void start() {
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

  void startConsole() {}
}
