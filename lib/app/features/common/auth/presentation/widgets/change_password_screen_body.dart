import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/change_password_form.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/change_password_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreenBody extends StatelessWidget {
  const ChangePasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 16,
        bottom: context.bottomPadding + 16,
      ),
      child: Column(
        children: [
          const ChangePasswordHeader(),
          20.height,
          const ChangePasswordForm(),
        ],
      ),
    );
  }
}
