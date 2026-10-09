import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AdminEditProfileFieldLabel extends StatelessWidget {
  const AdminEditProfileFieldLabel({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: context.semiBold12TextSub.copyWith(
        letterSpacing: 0.6,
      ),
    );
  }
}
