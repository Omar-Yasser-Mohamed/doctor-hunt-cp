import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/common/choose_role/presentation/widgets/choose_role_header.dart';
import 'package:doctor_hunt/app/features/common/choose_role/presentation/widgets/choose_role_submitting.dart';
import 'package:doctor_hunt/app/features/common/choose_role/presentation/widgets/role_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseRoleScreenBody extends StatelessWidget {
  const ChooseRoleScreenBody({super.key});

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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: context.topPadding + 24),

                      const ChooseRoleHeader(),

                      32.height,

                      const RoleSelection(),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    left: 14.w,
                    right: 14.w,
                    bottom: context.bottomPadding + 32,
                  ),
                  child: const ChooseRoleSubmitting(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
