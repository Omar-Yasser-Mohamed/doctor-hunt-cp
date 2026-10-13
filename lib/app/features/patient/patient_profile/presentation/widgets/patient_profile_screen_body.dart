import 'package:doctor_hunt/app/features/patient/patient_profile/presentation/widgets/patient_profile_form.dart';
import 'package:doctor_hunt/app/features/patient/patient_profile/presentation/widgets/patient_profile_header.dart';
import 'package:flutter/material.dart';

class PatientProfileScreenBody extends StatelessWidget {
  const PatientProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: const IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PatientProfileHeader(),
                  Expanded(
                    child: PatientProfileForm(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}