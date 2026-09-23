import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

class AdminTestScreen extends StatelessWidget {
  const AdminTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
        child: Text(
          'Admin',
          style: context.light16Primary,
        ),
      ),
    );
  }
}