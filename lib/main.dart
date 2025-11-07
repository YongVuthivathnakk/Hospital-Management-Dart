import 'domain/hospital/hospital.dart';
import './ui/hospital_console.dart';
// import 'package:hospital_management_dart/domain/hospital.dart';
// import 'package:hospital_management_dart/ui/hospital_console.dart';

void main() {
  Hospital hospital = Hospital();

  HospitalConsole console = HospitalConsole(hospital: hospital);

  console.startConsole();
}
