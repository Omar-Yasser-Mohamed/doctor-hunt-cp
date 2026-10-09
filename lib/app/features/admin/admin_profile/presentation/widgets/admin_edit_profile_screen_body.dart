import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/presentation/widgets/admin_edit_profile_form.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/presentation/widgets/admin_edit_profile_change_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminEditProfileScreenBody extends StatelessWidget {
  const AdminEditProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  12.height,

                  const AdminEditProfileChangePhoto(),

                  24.height,

                  const Expanded(child: AdminEditProfileForm()),

                  (context.bottomPadding + 16).height,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
