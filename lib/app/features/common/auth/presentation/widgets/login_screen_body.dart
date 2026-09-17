import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/forget_password_button.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/login_footer.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/login_form.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/login_header.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/o_auth_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: context.topPadding + (84.h),
                    ),

                    const LoginHeader(),

                    (68.h).height,

                    const OAuthSection(),

                    32.height,

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: const LoginForm(),
                    ),

                    12.height,

                    const ForgetPasswordButton(),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: context.bottomPadding + 32,
                  ),
                  child: const LoginFooter(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
