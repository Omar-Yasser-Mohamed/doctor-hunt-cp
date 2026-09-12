import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color primary = Color(0xFF0EBE7F);
  static const Color primaryLight = Color(0xFFE7F8F2);
  static const Color primaryDark = Color(0xFF03905E);

  static const Color secondary = Color(0xFF677294);
  static const Color secondaryLight = Color(0xFF94A3B8);
  static const Color secondaryDark = Color(0xFF475569);

  static const Color textMain = Color(0xFF333333);
  static const Color textSub = Color(0xFF677294);
  static const Color textPlaceholder = Color(0xFF94A3B8);
  static const Color textBorders = Color(0xFFE2E8F0);
  static const Color textDark = Color(0xFF222222);

  static const Color danger = Color(0xFFBA1A1A);
  static const Color dangerLight = Color(0xFFFEE2E2);

  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFFECFDF5);

  static const Color warning = Color(0xFFE9B02C);
  static const Color warningLight = Color(0xFFFFF7D6);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color boxShadow = Color(0x1A000000);

  //others
  static const Color skyBlue = Color(0xFF61CEFF);
  static const Color green = Color(0xFF07D9AD);
  static const Color darkBlue = Color(0xFF17202A);
  static const Color deepBlue = Color(0xFF7B8490);
  static const Color lightGreen = Color(0xFFD5E6E1);
  static const Color greenDeep = Color(0xFF006C49);
  static const Color greenLighter = Color(0xFFE6ECEA);
  static const Color greenSoft = Color(0xFFFAFCFB);
  static const Color graySoft = Color(0xFFE8F0E8);

  static Color topGradient = skyBlue.withValues(alpha: .72);
  static Color bottomGradient = primary.withValues(alpha: .3);
}
