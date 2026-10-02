import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_screen_body.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/floating_add_doctor_button.dart';
import 'package:flutter/material.dart';

class AdminDoctorsScreen extends StatelessWidget {
  const AdminDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminScaffold(
      body: AdminDoctorsScreenBody(),
      floatingActionButton: FloatingAddDoctorBotton(),
    );
  }
}
