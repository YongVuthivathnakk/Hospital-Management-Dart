import 'dart:io';
import '../../domain/patient/patient.dart';
import '../../domain/room/room.dart';
import '../console.dart';

// import 'package:hospital_management_dart/domain/patient.dart';
// import 'package:hospital_management_dart/domain/room.dart';
// import 'package:hospital_management_dart/ui/console.dart';

class ManageRoomConsole extends Console {
  ManageRoomConsole({required super.hospital});

  @override
  void start() {
    while (true) {
      print('\n=== ROOM MANAGEMENT ===');
      print('1. Add Room');
      print('2. Assign Patient to Room');
      print('3. View All Rooms');
      print('4. Back to Main Menu');
      stdout.write('Enter your choice: ');
      final choice = stdin.readLineSync();
      switch (choice) {
        case '1':
          addRoom();
          break;
        case '2':
          assignPatientToRoom();
          break;
        case '3':
          showAllRooms();
          break;
        case '4':
          return;
        default:
          print('⚠️ Invalid option. Try again.');
      }
    }
  }

  void showAllRooms() {
    List<Room> rooms = hospital.getRooms();

    if (rooms.isEmpty) {
      print('⚠️ No rooms found.');
    } else {
      print('\n🏠 All Rooms\n====================');
      for (var room in rooms) {
        print(room);
        print('---------------------------');
      }
    }

    sleep(const Duration(seconds: 2));
  }

  void assignPatientToRoom() {
    // Get all the avialable rooms
    List<Room> rooms = hospital.getRooms();
    int rIndex = 1;
    if (rooms.isEmpty) {
      print('⚠️ No rooms found.');
    } else {
      print('\n🏠 All Rooms\n---------------------------');
      for (var room in rooms) {
        print('[$rIndex]');
        print(room);
        print('---------------------------');
        rIndex++;
      }
    }
    // Select the room
    int roomIndex = 0;

    while (true) {
      stdout.write('Choose the room: ');
      try {
        roomIndex = int.parse(stdin.readLineSync() ?? '');

        if (roomIndex <= 0 || roomIndex > rooms.length) {
          print('⚠️ Invalid room index! Please choose a valid room.');
          continue;
        }

        final selectedRoom = rooms[roomIndex - 1];

        if (selectedRoom.isFull) {
          print(
            '⚠️ Room ${selectedRoom.roomNumber} is full! Choose another room.',
          );
          continue;
        }
        break;
      } catch (e) {
        print('⚠️ Invalid input! Please enter a valid number.');
      }
    }

    List<Patient> patients = hospital.getPatients();
    int pIndex = 1;
    if (patients.isEmpty) {
      print('⚠️ No patients found.');
    } else {
      print('\n🩺 All Patients\n---------------------------');
      for (var patient in patients) {
        print('[$pIndex]. $patient');
        print('---------------------------');
        pIndex++;
      }
    }
    // Select the patient
    int patientIndex = 0;
    while (true) {
      stdout.write('Choose patient: ');
      try {
        patientIndex = int.parse(stdin.readLineSync() ?? '');
        if (patientIndex <= 0) {
          print('⚠️ Option cannot be negative or zero!');
        } else if (patientIndex > pIndex) {
          print('⚠️ Invalid input! Please choose a valid patient.');
        } else if (patientIndex <= pIndex) {
          break;
        }
      } catch (e) {
        print('⚠️ Invalid input! Please choose a valid patient.');
      }
    }

    // Assign to room
    hospital.assignToRoom(
      roomIndex - 1,
      patientIndex - 1,
      patients[patientIndex - 1],
    );
    sleep(const Duration(seconds: 2));
  }

  void addRoom() {
    // Enter room number & check validation
    int number = 0;
    while (true) {
      stdout.write('Enter room number: ');
      try {
        number = int.parse(stdin.readLineSync() ?? '');
        if (number < 0) {
          print('⚠️ Room number cannot be negative!');
        } else if (number >= 0) {
          break;
        }
      } catch (e) {
        print('⚠️ Invalid input! Please enter a valid room number.');
      }
    }

    // Enter capacity & check validation
    int capacity = 0;
    while (true) {
      stdout.write('Enter room capacity: ');
      try {
        capacity = int.parse(stdin.readLineSync() ?? '');
        if (capacity < 0) {
          print('⚠️ Room number cannot be negative!');
        } else if (capacity > 0) {
          break;
        }
      } catch (e) {
        print('⚠️ Invalid input! Please enter a valid room number.');
      }
    }

    // Add to room files
    Room room = Room(roomNumber: number, capacity: capacity);
    hospital.addRoom(room);
    print('✅ Room "$number" created successfully!');
    sleep(const Duration(seconds: 2));
  }
}
