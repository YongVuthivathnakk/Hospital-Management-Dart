import 'dart:math';

import 'package:hospital_management_dart/data/room/room_repository.dart';
import 'package:hospital_management_dart/domain/patient/patient.dart';
import 'package:hospital_management_dart/domain/room/room.dart';
import 'package:test/test.dart';

void main() {
  group('RoomRepository', () {
    late RoomRepository roomRepository;
    setUp(() {
      roomRepository = RoomRepository();
    });

    test("getRooms should return all save rooms", () {
      final room1 = Room(roomNumber: 1, capacity: 5);
      final room2 = Room(roomNumber: 2, capacity: 2);
      final paitent = Patient(name: "Jake", gender: "Male", age: 10);
      roomRepository.addRoom(room1);
      roomRepository.addRoom(room2);
      roomRepository.assignToRoom(0, 0, paitent);

      final rooms = roomRepository.getRooms();

      expect(rooms.length, 2);
      expect(rooms[0].patients[0].name, "Jake");
    });
  });
}
