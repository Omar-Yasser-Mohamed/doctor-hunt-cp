import 'package:doctor_hunt/app/core/widgets/admin_scaffold.dart';
import 'package:doctor_hunt/app/features/admin/admin_appointments/presentation/widgets/admin_appointments_screen_body.dart';
import 'package:flutter/material.dart';

class AdminAppointmentsScreen extends StatelessWidget {
  const AdminAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminScaffold(
      body: AdminAppointmentsScreenBody(),
    );
  }
}