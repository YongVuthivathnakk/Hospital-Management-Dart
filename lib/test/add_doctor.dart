// test/doctor_repository_test.dart

import 'package:test/test.dart';
import 'package:hospital_management_dart/data/doctor/doctor_repository.dart';
import 'package:hospital_management_dart/domain/staff/staff.dart';

void main() {
  group('DoctorRepository', () {
    late DoctorRepository doctorRepository;

    setUp(() {
      doctorRepository = DoctorRepository();
    });

    test('getDoctors should return all saved doctors', () {
      final doctor1 = Doctor(name: 'Dr. One', gender: 'Male');
      final doctor2 = Doctor(name: 'Dr. Two', gender: 'Female');
      
      doctorRepository.addDoctor(doctor1);
      doctorRepository.addDoctor(doctor2);
      
      final doctors = doctorRepository.getDoctors();
      
      expect(doctors.length, 2);
      expect(doctors[0].name, 'Dr. One');
      expect(doctors[1].name, 'Dr. Two');
    });
  });
}