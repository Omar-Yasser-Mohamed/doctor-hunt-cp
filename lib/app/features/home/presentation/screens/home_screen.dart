import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/features/home/presentation/widgets/home_widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      topPos: 100.h,
      bottomPos: 10.h,
      child: const Scaffold(
        body: HomeScreenBody(),
      ),
    );
  }
}
