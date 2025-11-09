import 'dart:convert';
import 'dart:io';
import 'package:hospital_management_dart/data/base_path.dart';
import 'package:hospital_management_dart/domain/patient/patient.dart';

class PatientRepository {
void addPatient(Patient patient) {
    final file = File('$BASE_PATH/patient/patients.json');
    file.parent.createSync(recursive: true);

    List<Map<String, dynamic>> patientsMap = [];
    if (file.existsSync()) {
      final content = file.readAsStringSync();
      if (content.isNotEmpty) {
        patientsMap = List<Map<String, dynamic>>.from(jsonDecode(content));
      }
    }

    patientsMap.add(patient.toJson());
    file.writeAsStringSync(
      const JsonEncoder.withIndent('  ').convert(patientsMap),
    );
  }

  List<Patient> getPatients() {
    final file = File('$BASE_PATH/patient/patients.json');

    if (!file.existsSync()) return [];

    final content = file.readAsStringSync().trim();
    if (content.isEmpty) return [];

    final data = jsonDecode(content) as List;

    final patients = data.map((p) => Patient.fromJson(p)).toList();

    return patients;
  }}