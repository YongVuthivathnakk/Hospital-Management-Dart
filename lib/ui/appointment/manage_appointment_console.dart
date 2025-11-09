import 'dart:io';

import 'package:hospital_management_dart/data/appointment/appointment_repository.dart';
import 'package:hospital_management_dart/data/doctor/doctor_repository.dart';
import 'package:hospital_management_dart/data/patients/patient_repository.dart';
import 'package:hospital_management_dart/domain/appointment/appointment.dart';
import 'package:hospital_management_dart/domain/appointment/appointment_time.dart';
import 'package:hospital_management_dart/domain/hospital/hospital.dart';
import 'package:hospital_management_dart/domain/patient/patient.dart';
import 'package:hospital_management_dart/domain/staff/staff.dart';
class ManageAppointmentConsole {
  AppointmentRepository appointmentRepository;
  PatientRepository patientRepository;
  DoctorRepository doctorRepository;
  ManageAppointmentConsole({required this.appointmentRepository, required this.patientRepository, required this.doctorRepository});

  void start() {
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
    List<Appointment> appointments = appointmentRepository.getAppointments();

    if (appointments.isEmpty) {
      print('⚠️ No patients found.');
    } else {
      print('\n⏰ All Appointments\n---------------------------');
      for (var appointments in appointments) {
        print(appointments);
      }
    }
    sleep(const Duration(seconds: 2));
  }

  void createAppointment() {
    // === Show all patients ===
    List<Patient> patients = patientRepository.getPatients();
    if (patients.isEmpty) {
      print('⚠️ No patients found.');
      return;
    }

    print('\n🩺 All Patients\n---------------------------');
    for (int i = 0; i < patients.length; i++) {
      print('[${i + 1}] ${patients[i].name}');
    }
    print('---------------------------');

    // === Select patient ===
    int patientIndex = -1;
    while (true) {
      stdout.write('Choose patient (1-${patients.length}): ');
      try {
        patientIndex = int.parse(stdin.readLineSync() ?? '');
        if (patientIndex < 1 || patientIndex > patients.length) {
          print('⚠️ Invalid input! Please choose a valid patient.');
        } else {
          break;
        }
      } catch (e) {
        print('⚠️ Invalid input! Please enter a number.');
      }
    }
    final selectedPatient = patients[patientIndex - 1];

    // === Show all doctors ===
    List<Doctor> doctors = doctorRepository.getDoctors();
    if (doctors.isEmpty) {
      print('⚠️ No doctors found.');
      return;
    }

    print('\n👩‍⚕️ All Doctors\n---------------------------');
    for (int i = 0; i < doctors.length; i++) {
      print('[${i + 1}] ${doctors[i].name}');
    }
    print('---------------------------');

    // === Select doctor ===
    int doctorIndex = -1;
    while (true) {
      stdout.write('Choose doctor (1-${doctors.length}): ');
      try {
        doctorIndex = int.parse(stdin.readLineSync() ?? '');
        if (doctorIndex < 1 || doctorIndex > doctors.length) {
          print('⚠️ Invalid input! Please choose a valid doctor.');
        } else {
          break;
        }
      } catch (e) {
        print('⚠️ Invalid input! Please enter a number.');
      }
    }
    final selectedDoctor = doctors[doctorIndex - 1];

    // === Choose Appointment Time ===
    print('\n⏰ Choose Appointment Time\n---------------------------');
    for (int i = 0; i < AppointmentTime.values.length; i++) {
      print('[${i + 1}] ${AppointmentTime.values[i].name}');
    }
    print('---------------------------');

    int timeIndex = -1;
    while (true) {
      stdout.write('Select time (1-${AppointmentTime.values.length}): ');
      try {
        timeIndex = int.parse(stdin.readLineSync() ?? '');
        if (timeIndex < 1 || timeIndex > AppointmentTime.values.length) {
          print('⚠️ Invalid input! Please choose a valid time.');
        } else {
          break;
        }
      } catch (e) {
        print('⚠️ Invalid input! Please enter a number.');
      }
    }
    final selectedTime = AppointmentTime.values[timeIndex - 1];

    bool conflictAppointment= Hospital().isStaffAvailable(selectedDoctor.id, selectedTime);
    if(conflictAppointment) {
      print("\n⚠️ Staff is not available at this time");
      print("Please Try Again!");
      return;
    }; 

    appointmentRepository.addAppointment(
      selectedDoctor.id,
      selectedPatient.id,
      selectedTime,
    );

    // === Show confirmation ===
    print('\n✅ Appointment Summary');
    print('🧍 Patient: ${selectedPatient.name}');
    print('👩‍⚕️ Doctor : ${selectedDoctor.name}');
    print('🕒 Time    : ${selectedTime.name}');
    sleep(const Duration(seconds: 2));
  }
}
