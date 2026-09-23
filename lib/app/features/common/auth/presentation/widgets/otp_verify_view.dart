import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/bottom_sheet_header.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/otp_form.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class OtpVerifyView extends StatelessWidget {
  const OtpVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomSheetHeader(
          title: t.enterDigitsCode,
          description: t.enterDigitsDescription,
        ),

        27.height,

        const OtpForm(),
      ],
    );
  }
}
