import 'dart:io';

import '../../domain/hospital/hospital.dart';
import '../../domain/staff/staff.dart';
import '../../util/input_validator.dart';
// import 'package:hospital_management_dart/domain/hospital.dart';
// import 'package:hospital_management_dart/domain/staff.dart';
// import 'package:hospital_management_dart/util/input_validator.dart';

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
          addDoctor();
          break;
        case '2':
          addNurse();
          break;
        case '3':
          addAdministrativePersonnel();
          break;
        case '4':
          showAllStaff();
          break;
        case '5':
          return; // back to main menu
        default:
          print('⚠️ Invalid option. Try again.');
      }
    }
  }

  void showAllStaff() {
    print('\n📋 All Staff Members\n=======================\n');
    // --- Doctors ---
    var doctors = hospital.getDoctors();

    if (doctors.isNotEmpty) {
      print('🩺 Doctors\n---------------------------');
      for (var doctor in hospital.getDoctors()) {
        print(doctor);
      }
      print('');
    }

    //   // --- Nurses ---
    var nurses = hospital.getNurses();
    if (nurses.isNotEmpty) {
      print('🩺 Nurses\n---------------------------');
      for (var nurse in nurses) {
        print(nurse);
      }
      print('');
    }

    // --- Administrative Staff ---
    var administrativePersonnels = hospital.getAdministrativePersonnel();
    if (administrativePersonnels.isNotEmpty) {
      print('🩺 Administrative Personnel\n---------------------------');
      for (var admin in administrativePersonnels) {
        print(admin);
      }
      print('');
    }

    sleep(const Duration(seconds: 2));
  }

  void addAdministrativePersonnel() {
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

    String gender = InputValidator.validateGender();

    AdministrativePersonnel administrativePersonnel = AdministrativePersonnel(
      name: name,
      gender: gender,
    );
    hospital.addAdministrativePersonnel(administrativePersonnel);

    print('✅ Administrative staff "$name" created successfully!');

    sleep(const Duration(seconds: 2));
  }

  void addNurse() {
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

    String gender = InputValidator.validateGender();

    Nurse nurse = Nurse(name: name, gender: gender);
    hospital.addNurse(nurse);
    print('✅ Nurse "$name" created successfully!');
    sleep(const Duration(seconds: 2));
  }

  void addDoctor() {
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

    String gender = InputValidator.validateGender();
    Doctor doctor = Doctor(name: name, gender: gender);
    hospital.addDoctor(doctor);
    print('✅ Doctor "${doctor.name}" created successfully!');
    sleep(const Duration(seconds: 2));
  }

  void startConsole() {}
}
