import 'package:doctor_hunt/app/core/extensions/context_extentions.dart';
import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/theme/app_colors.dart';
import 'package:doctor_hunt/app/core/utils/app_images.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/features/onboarding/presentation/widgets/onboarding_actions.dart';
import 'package:doctor_hunt/app/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      showTopDecoration: false,
      child: Scaffold(
        body: Stack(
          children: [
            _buildBackground(),

            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                OnboardingContent(
                  image: AppImages.onboardingOne,
                  title: context.t.onboarding.findTrustedDoctors,
                  description:
                      context.t.onboarding.findTrustedDoctorsDescription,
                ),
                OnboardingContent(
                  image: AppImages.onboardingTwo,
                  title: context.t.onboarding.chooseBestDoctors,
                  description:
                      context.t.onboarding.chooseBestDoctorsDescription,
                ),
                OnboardingContent(
                  image: AppImages.onboardingThree,
                  title: context.t.onboarding.easyAppointments,
                  description: context.t.onboarding.easyAppointmentsDescription,
                ),
              ],
            ),

            Positioned(
              left: 40.w,
              right: 40.w,
              bottom: context.bottomPadding + 30,
              child: OnboardingActions(
                onPressedNext: () {
                  if (currentPage == 2) {
                    context.go(AppRoutes.chooseRoleScreen);
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  }
                },
                onPressedSkip: () {
                  context.go(AppRoutes.chooseRoleScreen);
                },
                currentPage: currentPage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    final circlePositions = [
      -104.w, // page 0
      175.w, // page 1
      -104.w, // page 2
    ];
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      top: -20.h,
      left: circlePositions[currentPage],
      child: Container(
        width: 342.w,
        height: 342.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.green,
            ],
          ),
        ),
      ),
    );
  }
}
