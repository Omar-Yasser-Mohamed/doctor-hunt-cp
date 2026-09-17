import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/app_nav_bar.dart';
import 'package:doctor_hunt/app/features/common/choose_role/presentation/screens/choose_role_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/screens/register_screen.dart';
import 'package:doctor_hunt/app/features/common/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:doctor_hunt/app/features/common/splash/presentation/screens/splash_screen.dart';
import 'package:doctor_hunt/app/features/patient/doctor_details/presentation/screens/doctor_details_screen.dart';
import 'package:doctor_hunt/app/features/patient/search/presentation/screens/find_doctors_screen.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract final class RouterConfiguration {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.chooseRoleScreen,
        builder: (context, state) => const ChooseRoleScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.homeScreen,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.favoriteScreen,
                builder: (context, state) => const AppBackground(
                  child: Scaffold(
                    body: Center(
                      child: Text("Favorites"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.bookingScreen,
                builder: (context, state) => const AppBackground(
                  child: Scaffold(
                    body: Center(
                      child: Text("Bookings"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.conversationsScreen,
                builder: (context, state) => const AppBackground(
                  child: Scaffold(
                    body: Center(
                      child: Text("conversations"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.doctorDetailsScreen,
        builder: (context, state) => const DoctorDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.findDoctorsScreen,
        builder: (context, state) => const FindDoctorsScreen(),
      ),
    ],
  );
}
