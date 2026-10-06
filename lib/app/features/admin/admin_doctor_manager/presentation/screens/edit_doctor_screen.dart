import 'package:doctor_hunt/app/core/shared/models/doctor_model.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/widgets/edit_doctor_screen_body.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class EditDoctorScreen extends StatelessWidget {
  const EditDoctorScreen({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          t.editDoctor,
          style: context.bold18TextMain,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: EditDoctorScreenBody(doctor: doctor),
    );
  }
}
