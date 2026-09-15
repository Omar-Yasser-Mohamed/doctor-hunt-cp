import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/app_back_button.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/find_doctors_widgets/find_doctors_screen_body.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class FindDoctorsScreen extends StatelessWidget {
  const FindDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBackButton(),
          title: Text(
            t.findDoctors.findDoctors,
            style: context.medium18TextMain,
          ),
        ),
        body: const FindDoctorsScreenBody(),
      ),
    );
  }
}
