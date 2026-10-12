import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  final double? size;
  final EdgeInsetsGeometry? margin;

  const AppBackButton({
    super.key,
    this.size,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: Container(
          margin: margin ?? EdgeInsetsDirectional.only(start: 20.w),
          width: size ?? 30.w,
          height: size ?? 30.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: AppColors.textSub,
          ),
        ),
      ),
    );
  }
}
