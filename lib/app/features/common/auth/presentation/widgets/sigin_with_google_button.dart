import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/snake_bar_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_icons.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/google_bloc/google_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignWithGoogleButton extends StatelessWidget {
  const SignWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleBloc, GoogleState>(
      listener: (context, state) {
        if (state is GoogleSuccess) {
          final userRole = state.user.userRole;
          if (userRole == UserRole.patient) {
            const PatientHomeRoute().go(context);
          } else if (userRole == UserRole.admin) {
            const AdminTestRoute().go(context);
          }
        } else if (state is GoogleFailure) {
          context.showErrorSnakbar(message: state.failure.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is GoogleLoading;
        return GestureDetector(
          onTap: isLoading
              ? null
              : () {
                  context.read<GoogleBloc>().add(GoogleSubmitted());
                },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: .06),
                  blurRadius: 22,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: isLoading
                  ? Center(
                      key: const ValueKey("loading"),
                      child: SizedBox(
                        width: 18.r,
                        height: 18.r,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.r,
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  : Row(
                      key: const ValueKey("content"),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.google,
                          width: 18.w,
                          height: 18.h,
                        ),

                        12.width,

                        Text(t.google, style: context.light16TextSub),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
