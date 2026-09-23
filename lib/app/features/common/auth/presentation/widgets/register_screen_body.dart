import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/sigin_with_google_button.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/register_footer.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/register_form.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/register_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          (110.h).height,

          const RegisterHeader(),

          (67.h).height,

          const SignWithGoogleButton(),

          34.height,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const RegisterForm(),
          ),

          18.height,

          const RegisterFooter(),

          (context.bottomPadding + 24).height,
        ],
      ),
    );
  }
}
