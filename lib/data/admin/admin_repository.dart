import 'dart:convert';
import 'dart:io';

import 'package:hospital_management_dart/data/base_path.dart';
import 'package:hospital_management_dart/domain/staff/staff.dart';

class AdminRepository {
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
}