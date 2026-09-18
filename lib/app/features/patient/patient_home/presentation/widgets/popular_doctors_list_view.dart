import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/utils/app_images.dart';
import 'package:doctor_hunt/app/core/widgets/dynamic_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PopularDoctorsListView extends StatelessWidget {
  const PopularDoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.none,
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 4.w),
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const PopularDoctorCard();
      },
    );
  }
}

class PopularDoctorCard extends StatelessWidget {
  const PopularDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.patientDoctorDetailsScreen);
      },
      child: Container(
        width: 190.w,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsetsDirectional.only(end: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 40,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image.asset(
                AppImages.doctorTest,
                fit: BoxFit.cover,
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dr. Fillerup Grab",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.medium18TextMain,
                  ),
      
                  Text(
                    "Medicine Specialist",
                    style: context.light12.copyWith(
                      color: AppColors.textSub.withValues(alpha: .8),
                    ),
                  ),
      
                  4.height,
      
                  const DynamicRatingStars(
                    rating: 4,
                    size: 22,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
