import 'package:doctor_hunt/app/core/widgets/patient_scaffold.dart';
import 'package:doctor_hunt/app/features/patient/patient_appointments/presentations/widgets/patient_appointments_screen_body.dart';
import 'package:flutter/widgets.dart';

class PatientAppointmentsScreen extends StatelessWidget {
  const PatientAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      showTopDecoration: false,
      child: PatientAppointmentsScreenBody(),
    );
  }
}