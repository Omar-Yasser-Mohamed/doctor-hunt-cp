import 'package:flutter/material.dart';

class TimeUtils {
  static String toSupabaseFormat(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:'
        '${time.minute.toString().padLeft(2, '0')}:00';
  }

  static TimeOfDay fromSupabaseFormat(String value) {
    final parts = value.split(':');

    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }
}