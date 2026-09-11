import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Column(
            children: [
              24.height,

              AppTextField(
                hintText: "hint text",
              ),

              24.height,

              AppButton(
                onPressed: () {},
                text: context.t.appName,
              ),

              80.height,
            ],
          ),
        ),
      ),
    );
  }
}
