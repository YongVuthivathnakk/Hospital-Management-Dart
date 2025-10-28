import 'package:hospital_management_dart/domain/hospital.dart';

abstract class Console {
  Hospital hospital;
  Console({required this.hospital});

  void start() {}
}
