import 'dart:io';

class InputValidator {
  static String validateGender() {
    while (true) {
      stdout.write('Choose gender (1 = Male, 2 = Female): ');
      final input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        print('⚠️ Please enter a number (1 or 2).');
        continue;
      }

      final option = int.tryParse(input);

      if (option == null || (option != 1 && option != 2)) {
        print('⚠️ Invalid choice. Please enter 1 for Male or 2 for Female.');
        continue;
      }

      return (option == 1) ? 'Male' : 'Female';
    }
  }
}
