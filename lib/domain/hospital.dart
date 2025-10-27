import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:hospital_management_dart/domain/patient.dart';
import 'package:hospital_management_dart/domain/room.dart';
import 'package:hospital_management_dart/domain/staff.dart';

const BASE_PATH = "lib/data/staff/";

class Hospital {
  List<Patient> patients = [];
  List<Room> rooms = [];

  //  ====== Doctor =====
  void addDoctor(Doctor doctor) {
    final file = File('$BASE_PATH/doctors.json');
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

  List<dynamic> getDoctors() {
    final file = File('$BASE_PATH/doctors.json');

    if (!file.existsSync()) return [];

    final content = file.readAsStringSync().trim();
    if (content.isEmpty) return [];

    final data = jsonDecode(content) as List;

    final doctors = data
        .map(
          (n) => {
            "id": n['id'],
            "name": n['name'],
            "salary": (n['salary'] ?? 0).toDouble(),
            "position": n['position'],
          },
        )
        .toList();

    return doctors;
  }

  //  ====== Nurse =====

  void addNurse(Nurse nurse) {
    final file = File('$BASE_PATH/nurses.json');
    file.parent.createSync(recursive: true);

    List<Map<String, dynamic>> nursesMap = [];
    if (file.existsSync()) {
      final content = file.readAsStringSync();
      if (content.isNotEmpty) {
        nursesMap = List<Map<String, dynamic>>.from(jsonDecode(content));
      }
    }

    nursesMap.add(nurse.toJson());
    file.writeAsStringSync(
      const JsonEncoder.withIndent('  ').convert(nursesMap),
    );
  }

  List<dynamic> getNurses() {
    final file = File('$BASE_PATH/nurses.json');

    if (!file.existsSync()) return [];

    final content = file.readAsStringSync().trim();
    if (content.isEmpty) return [];

    final data = jsonDecode(content) as List;

    final nurses = data
        .map(
          (n) => {
            "id": n['id'],
            "name": n['name'],
            "salary": (n['salary'] ?? 0).toDouble(),
            "position": n['position'],
          },
        )
        .toList();

    return nurses;
  }

  //  ====== Admin =====

  void addAdministrativePersonnel(AdministrativePersonnel admin) {
    final file = File('$BASE_PATH/administrative_personnels.json');
    file.parent.createSync(recursive: true);

    List<Map<String, dynamic>> adminMap = [];
    if (file.existsSync()) {
      final content = file.readAsStringSync();
      if (content.isNotEmpty) {
        adminMap = List<Map<String, dynamic>>.from(jsonDecode(content));
      }
    }

    adminMap.add(admin.toJson());
    file.writeAsStringSync(
      const JsonEncoder.withIndent('  ').convert(adminMap),
    );
  }

  List<dynamic> getAdministrativePersonnel() {
    final file = File('$BASE_PATH/administrative_personnels.json');

    if (!file.existsSync()) return [];

    final content = file.readAsStringSync().trim();
    if (content.isEmpty) return [];

    final data = jsonDecode(content) as List;

    final administrativePersonnels = data
        .map(
          (n) => {
            "id": n['id'],
            "name": n['name'],
            "salary": (n['salary'] ?? 0).toDouble(),
            "position": n['position'],
          },
        )
        .toList();

    return administrativePersonnels;
  }

  //  ====== Patient =====

  void addPatient(Patient patient) => patients.add(patient);

  //  ====== Room =====
  void addRoom(Room room) => rooms.add(room);
}
