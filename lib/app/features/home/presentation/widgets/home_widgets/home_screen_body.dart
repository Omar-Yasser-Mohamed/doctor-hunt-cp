import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/home_widgets/categories_list_view.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/home_widgets/feature_doctors_section.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/home_widgets/home_header.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/home_widgets/live_doctors_section.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/home_widgets/popular_doctors_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsetsDirectional.only(bottom: 108.h),
      child: Column(
        children: [
          const HomeHeader(),

          const LiveDoctorsSection(),

          30.height,

          SizedBox(
            height: 90.h,
            child: const CategoriesListView(),
          ),

          30.height,

          const PopularDoctorsSection(),

          30.height,

          const FeatureDoctorsSection(),
        ],
      ),
    );
  }
}
