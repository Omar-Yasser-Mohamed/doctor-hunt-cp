import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/register_widgets/register_footer.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/register_widgets/register_form.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/register_widgets/register_header.dart';
import 'package:doctor_hunt/app/features/auth/presentation/widgets/shared/o_auth_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: context.topPadding + (90.h),
          ),

          const RegisterHeader(),

          (67.h).height,

          const OAuthSection(),

          34.height,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: const RegisterForm(),
          ),

          18.height,

          const RegisterFooter(),
        ],
      ),
    );
  }
}
