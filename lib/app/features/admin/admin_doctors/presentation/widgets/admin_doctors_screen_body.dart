import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_app_bar.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_filters_list.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_header.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/admin_doctors_list_view.dart';
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/widgets/no_doctors_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminDoctorsScreenBody extends StatelessWidget {
  const AdminDoctorsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final testList = [1];

    return CustomScrollView(
      slivers: [
        const AdminDoctorsAppBar(),

        const SliverToBoxAdapter(
          child: AdminDoctorsHeader(),
        ),

        SliverToBoxAdapter(child: 14.height),

        if (testList.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 28.h,
              child: const AdminDoctorsFiltersList(),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.only(
              top: 22,
              left: 20.w,
              right: 20.w,
              bottom: 12,
            ),
            sliver: const AdminDoctorsListView(),
          ),
        ] else ...[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 464.h,
              child: const NoDoctorsWidget(),
            ),
          ),
        ],
      ],
    );
  }
}
