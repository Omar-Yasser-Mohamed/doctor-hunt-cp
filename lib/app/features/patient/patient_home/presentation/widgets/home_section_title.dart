import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/generated/translations.g.dart' show t;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({
    super.key,
    required this.title,
    this.onSeeAll,
    this.showSeeAll = true,
  });

  final String title;
  final bool showSeeAll;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: context.semiBold18TextMain,
            ),
          ),

          if (showSeeAll)
            GestureDetector(
              onTap: onSeeAll,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    t.home.seeAll,
                    style: context.light12TextSub,
                  ),

                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.textSub,
                    size: 10.sp,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
