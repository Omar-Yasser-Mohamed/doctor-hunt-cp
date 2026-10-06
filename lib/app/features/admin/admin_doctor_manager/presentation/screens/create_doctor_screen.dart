import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/widgets/create_doctor_screen_body.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class CreateDoctorScreen extends StatelessWidget {
  const CreateDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          t.createDoctor,
          style: context.bold18TextMain,
        ),
      ),
      body: const CreateDoctorScreenBody(),
    );
  }
}