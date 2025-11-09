import 'dart:convert';
import 'dart:io';

import 'package:hospital_management_dart/data/base_path.dart';
import 'package:hospital_management_dart/domain/patient/patient.dart';
import 'package:hospital_management_dart/domain/room/room.dart';

class RoomRepository {
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