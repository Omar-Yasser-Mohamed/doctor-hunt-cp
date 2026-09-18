import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/features/patient/appointment/presentation/widgets/appointment_date_selection.dart';
import 'package:doctor_hunt/app/features/patient/appointment/presentation/widgets/appointment_success_dialog.dart';
import 'package:doctor_hunt/app/features/patient/appointment/presentation/widgets/appointment_time_section.dart';
import 'package:doctor_hunt/app/features/patient/appointment/presentation/widgets/reminder_me_section.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientAppointmentScreenBody extends StatelessWidget {
  const PatientAppointmentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              children: [
                8.height,

                const AppointmentDateSelection(),

                28.height,

                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 32,
                      bottom: context.bottomPadding + 24,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 25,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const AppointmentTimeSection(),

                        38.height,

                        const ReminderMeSection(),

                        24.height,

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: AppButton(
                            text: t.common.confirm,
                            onPressed: () => AppointmentSuccessDialog.show(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
