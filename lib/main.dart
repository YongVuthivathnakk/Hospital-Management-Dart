import 'package:hospital_management_dart/data/admin/admin_repository.dart';
import 'package:hospital_management_dart/data/appointment/appointment_repository.dart';
import 'package:hospital_management_dart/data/doctor/doctor_repository.dart';
import 'package:hospital_management_dart/data/nurse/nurse_repository.dart';
import 'package:hospital_management_dart/data/patients/patient_repository.dart';
import 'package:hospital_management_dart/data/room/room_repository.dart';

import './ui/hospital_console.dart';


void main() {
  
  HospitalConsole console = HospitalConsole(adminRepository: AdminRepository(), doctorRepository: DoctorRepository(), nurseRepository: NurseRepository(), patientRepository: PatientRepository(), roomRepository: RoomRepository(), appointmentRepository: AppointmentRepository());

  console.startConsole();
}
