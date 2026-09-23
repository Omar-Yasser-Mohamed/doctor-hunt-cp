import 'package:doctor_hunt/app/core/extensions/sized_box_extentions.dart';
import 'package:doctor_hunt/app/core/theme/app_text_styles.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';

class OnboardingActions extends StatelessWidget {
  const OnboardingActions({
    super.key,
    required this.onPressedNext,
    required this.onPressedSkip,
    required this.currentPage,
  });
  final void Function()? onPressedNext;
  final void Function()? onPressedSkip;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppButton(
          text: currentPage == 2 ? t.getStarted : t.next,
          onPressed: onPressedNext,
        ),

        6.height,

        GestureDetector(
          onTap: onPressedSkip,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              t.skip,
              style: context.regular14TextSub,
            ),
          ),
        ),
      ],
    );
  }
}
