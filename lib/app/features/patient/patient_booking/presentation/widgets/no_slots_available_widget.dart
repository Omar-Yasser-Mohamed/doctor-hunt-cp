import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_lotties.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NoSlotsAvailableWidget extends StatelessWidget {
  const NoSlotsAvailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              AppLotties.noDataFound,
              width: 280.w,
              height: 280.w,
              repeat: false,
            ),

            Text(
              t.noSlotsAvailable,
              style: context.regular16TextSub,
            ),
          ],
        ),
      ),
    );
  }
}
