import 'dart:convert';
import 'dart:io';
import 'package:hospital_management_dart/data/base_path.dart';
import 'package:hospital_management_dart/domain/staff/staff.dart';

class DoctorRepository {
  void addDoctor(Doctor doctor) {
    final file = File('$BASE_PATH/staff/doctors.json');
    file.parent.createSync(recursive: true);

    List<Map<String, dynamic>> doctorsMap = [];
    if (file.existsSync()) {
      final content = file.readAsStringSync();
      if (content.isNotEmpty) {
        doctorsMap = List<Map<String, dynamic>>.from(jsonDecode(content));
      }
    }

    doctorsMap.add(doctor.toJson());
    file.writeAsStringSync(
      const JsonEncoder.withIndent('  ').convert(doctorsMap),
    );
  }

    List<Doctor> getDoctors() {
    final file = File('$BASE_PATH/staff/doctors.json');

    if (!file.existsSync()) return [];

    final content = file.readAsStringSync().trim();
    if (content.isEmpty) return [];

    final data = jsonDecode(content) as List;

    final doctors = data.map((d) => Doctor.fromJson(d)).toList();

    return doctors;
  }
}