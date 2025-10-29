import 'dart:convert';
import 'dart:io';
import 'package:hospital_management_dart/domain/patient.dart';
import 'package:hospital_management_dart/domain/room.dart';
import 'package:hospital_management_dart/domain/staff.dart';

const BASE_PATH = "lib/data/";

class Hospital {
  List<Patient> patients = [];

  //  ====== Doctor =====
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

  //  ====== Nurse =====

  void addNurse(Nurse nurse) {
    final file = File('$BASE_PATH/staff/nurses.json');
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
    final file = File('$BASE_PATH/staff/nurses.json');

    if (!file.existsSync()) return [];

    final content = file.readAsStringSync().trim();
    if (content.isEmpty) return [];

    final data = jsonDecode(content) as List;

    final nurses = data.map((n) => Nurse.fromJson(n)).toList();

    return nurses;
  }

  //  ====== Admin =====

  void addAdministrativePersonnel(AdministrativePersonnel admin) {
    final file = File('$BASE_PATH/staff/administrative_personnels.json');
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

  List<AdministrativePersonnel> getAdministrativePersonnel() {
    final file = File('$BASE_PATH/staff/administrative_personnels.json');

    if (!file.existsSync()) return [];

    final content = file.readAsStringSync().trim();
    if (content.isEmpty) return [];

    final data = jsonDecode(content) as List;

    final administrativePersonnels = data
        .map((a) => AdministrativePersonnel.fromJson(a))
        .toList();

    return administrativePersonnels;
  }

  //  ====== Patient =====

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
  }

  //  ====== Room =====

  void addRoom(Room room) {
    final file = File('$BASE_PATH/room/rooms.json');
    file.parent.createSync(recursive: true);

    List<Map<String, dynamic>> roomsMap = [];
    if (file.existsSync()) {
      final content = file.readAsStringSync();
      if (content.isNotEmpty) {
        roomsMap = List<Map<String, dynamic>>.from(jsonDecode(content));
      }
    }

    roomsMap.add(room.toJson());
    file.writeAsStringSync(
      const JsonEncoder.withIndent('  ').convert(roomsMap),
    );
  }

  List<Room> getRooms() {
    final file = File('$BASE_PATH/room/rooms.json');

    if (!file.existsSync()) return [];

    final content = file.readAsStringSync().trim();
    if (content.isEmpty) return [];

    final data = jsonDecode(content) as List;

    final rooms = data.map((r) => Room.fromJson(r)).toList();

    return rooms;
  }

  void assignToRoom(int roomIndex, int patientIndex, Patient patient) {
    final file = File('$BASE_PATH/room/rooms.json');
    if (!file.existsSync()) return;

    final content = file.readAsStringSync().trim();
    if (content.isEmpty) return;

    // Load existing rooms
    final data = jsonDecode(content) as List;
    final rooms = data.map((r) => Room.fromJson(r)).toList();

    // Check if patient already exists in that room
    if (rooms[roomIndex].patients.any((p) => p.id == patient.id)) {
      print(
        "⚠️ Patient already included in this room. Please choose another patient!",
      );
      return;
    }

    // Assign patient
    rooms[roomIndex].assignPatient(patient);

    // Save back to file (overwrite)
    final updatedData = rooms.map((r) => r.toJson()).toList();
    file.writeAsStringSync(
      const JsonEncoder.withIndent('  ').convert(updatedData),
    );

    print("✅ Patient successfully assigned to Room id: ${rooms[roomIndex].id}");
  }
}
