import 'package:flutter/services.dart';

class CustomRegexORNumbersOnlyWithMaxLengthFormatter
    extends TextInputFormatter {
  final int maxLength;

  CustomRegexORNumbersOnlyWithMaxLengthFormatter({required this.maxLength});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue,
      {RegExp? reg}) {
    final newText = newValue.text;

    // Ensure input contains only digits and is within the max length
    if ((reg ?? RegExp(r"^\d*$")).hasMatch(newText) &&
        newText.length <= maxLength) {
      return newValue;
    }

    // Revert to the old value if the new value is invalid
    return oldValue;
  }
}

