import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_outline_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class NoSlotsAvailableWidget extends StatelessWidget {
  const NoSlotsAvailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          16.height,

          Text(
            t.noSlotsAvailable,
            style: context.regular14TextSub,
          ),

          28.height,

          AppButton(
            text:
                "${t.nextAvailabilityOn} "
                "${DateFormat("EE, dd MMM").format(DateTime.now().add(const Duration(days: 1)))}",
            onPressed: () {},
          ),

          14.height,

          Text(
            t.or,
            style: context.regular14TextSub,
          ),

          14.height,

          AppOutlineButton(
            text: t.contactClinic,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
