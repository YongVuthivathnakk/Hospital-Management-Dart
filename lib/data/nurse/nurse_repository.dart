import 'dart:convert';
import 'dart:io';

import 'package:hospital_management_dart/data/base_path.dart';
import 'package:hospital_management_dart/domain/staff/staff.dart';


class NurseRepository {
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
}
