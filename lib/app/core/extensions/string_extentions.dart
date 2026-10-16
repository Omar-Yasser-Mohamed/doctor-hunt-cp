import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:flutter/widgets.dart';

extension StringExtention on String {
  String get toAvatar {
    if (trim().isEmpty) return "";
    final parts = split(RegExp(r'\s+'));
    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    }
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }
}

extension IntExtention on int {
  String toLocaleDigits(BuildContext context) {
    if (context.isArabic) {
      const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
      return toString().split('').map((char) {
        final digit = int.tryParse(char);
        return digit != null ? arabicDigits[digit] : char;
      }).join('');
    }
    return toString();
  }
}