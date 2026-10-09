import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/patient_nav_bar.dart';
import 'package:doctor_hunt/app/core/widgets/profile_image.dart';
import 'package:doctor_hunt/app/features/common/user/presentation/controller/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/generated/translations.g.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: context.topPadding + 16,
            left: 20.w,
            right: 20.w,
            bottom: 52.h,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: context.isArabic
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              end: context.isArabic
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              colors: const [
                AppColors.lighterGreen,
                AppColors.green,
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is UserSuccess) {
                          return Text(
                            t.hi(name: state.user.user.name),
                            style: context.light20White,
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),

                    2.height,

                    Text(
                      t.findYourDoctor,
                      style: context.bold24White,
                    ),
                  ],
                ),
              ),

              8.width,

              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserSuccess) {
                    return GestureDetector(
                      onTap: () {
                        DrawerControllerProvider.of(context).showDrawer();
                      },
                      child: ProfileImage(
                        name: state.user.user.name,
                        imageUrl: state.user.user.image,
                        size: 60.r,
                        backgroundColor: AppColors.successLight,
                        border: Border.all(
                          color: AppColors.borderGreenSoft,
                          width: 2,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.white,
                            spreadRadius: 4,
                          ),
                        ],
                        avatarTextStyle: context.bold20Primary,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),

        const _HomeSearchButton(),
      ],
    );
  }
}

class _HomeSearchButton extends StatelessWidget {
  const _HomeSearchButton();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -28.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: .08),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: AppTextField(
          hintText: t.search,
          readOnly: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(
            Icons.close,
            color: AppColors.textSub,
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.textSub,
          ),
          onTap: () {
            const PatientFindDoctorsRoute().push(context);
          },
        ),
      ),
    );
  }
}
