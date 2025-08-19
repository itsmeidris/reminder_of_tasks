import 'package:flutter/services.dart';

class HourInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    final intValue = int.tryParse(text) ?? 0;
    if (intValue < 1 || intValue > 24) {
      return oldValue; // Revert to old value if invalid
    }
    return newValue;
  }
}

class MinuteInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    final intValue = int.tryParse(text) ?? 0;
    if (intValue < 0 || intValue > 59) {
      return oldValue; // Revert to old value if invalid
    }
    return newValue;
  }
}

