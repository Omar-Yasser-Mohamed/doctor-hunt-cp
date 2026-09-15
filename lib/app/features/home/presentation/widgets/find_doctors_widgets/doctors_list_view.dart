import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/find_doctors_widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
        top: 16,
        bottom: context.bottomPadding + 8,
        left: 20.w,
        right: 20.w,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const DoctorCard();
      },
    );
  }
}
