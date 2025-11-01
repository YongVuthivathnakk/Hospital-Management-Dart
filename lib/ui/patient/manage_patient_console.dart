import 'dart:io';

import 'package:hospital_management_dart/domain/patient.dart';
import 'package:hospital_management_dart/ui/console.dart';
import 'package:hospital_management_dart/util/input_validator.dart';

class ManagePatientConsole extends Console {
  ManagePatientConsole({required super.hospital});

  @override
  void start() {
    while (true) {
      print('\n=== PATIENT MANAGEMENT ===');
      print('1. Add Patient');
      print('2. View All Patients');
      print('3. Back to Main Menu');
      stdout.write('Enter your choice: ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          addPatient();
          break;
        case '2':
          showAllPatient();
          break;
        case '3':
          return;
        default:
          print('⚠️ Invalid option. Try again.');
      }
    }
  }

  void showAllPatient() {
    List<Patient> patients = hospital.getPatients();
    
    if (patients.isEmpty) {
      print('⚠️ No patients found.');
    } else {
      print('\n🩺 All Patients\n---------------------------');
      for (var patient in patients) {
        print(patient);
      }
    }
    
    sleep(const Duration(seconds: 2));
  }

  void addPatient() {
    String name;
    while (true) {
      stdout.write('Enter patient name: ');
      name = stdin.readLineSync() ?? '';
      if (name == '' || name.isEmpty) {
        print("⚠️ Name must not be empty!");
      } else {
        break;
      }
    }
    int age = 0;
    while (true) {
      stdout.write('Enter age: ');
      try {
        age = int.parse(stdin.readLineSync() ?? '');
        if (age < 0) {
          print('⚠️ Age cannot be negative!');
        } else if (age > 0) {
          break;
        }
      } catch (e) {
        print('⚠️ Invalid input! Please enter a valid age.');
      }
    }
    
    String gender = InputValidator.validateGender();
    
    Patient patient = Patient(name: name, age: age, gender: gender);
    hospital.addPatient(patient);
    
    print('✅ Patient "$name" created successfully!');
    sleep(const Duration(seconds: 2));
  }
}
