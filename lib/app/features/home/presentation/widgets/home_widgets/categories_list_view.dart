import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/shared/enums/doctor_specialty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      scrollDirection: Axis.horizontal,
      itemCount: DoctorSpecialty.values.length,
      separatorBuilder: (context, index) => 12.width,
      itemBuilder: (context, index) => CategoryCard(
        specialty: DoctorSpecialty.values[index],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.specialty});
  final DoctorSpecialty specialty;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      decoration: BoxDecoration(
        gradient: specialty.linarGradient,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: -33.w,
            child: _notice(size: 67.w, alpha: 0.08),
          ),
          Positioned(
            bottom: -30.h,
            child: _notice(size: 80.w, alpha: 0.06),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              specialty.svgIcon,
              width: 34.w,
              height: 34.h,
              fit: BoxFit.scaleDown,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _notice({required double size, required double alpha}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: alpha),
      ),
    );
  }
}
