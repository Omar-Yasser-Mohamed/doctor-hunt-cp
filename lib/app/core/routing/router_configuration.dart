import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/widgets/app_scaffold.dart';
import 'package:doctor_hunt/app/core/widgets/patient_nav_bar.dart';
import 'package:doctor_hunt/app/features/common/choose_role/presentation/screens/choose_role_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/screens/register_screen.dart';
import 'package:doctor_hunt/app/features/common/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:doctor_hunt/app/features/common/splash/presentation/screens/splash_screen.dart';
import 'package:doctor_hunt/app/features/patient/appointment/presentation/screens/patient_appointment_screen.dart';
import 'package:doctor_hunt/app/features/patient/doctor_details/presentation/screens/patient_doctor_details_screen.dart';
import 'package:doctor_hunt/app/features/patient/search/presentation/screens/patient_find_doctors_screen.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/screens/patient_home_screen.dart';
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
          return PatientNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.patientHomeScreen,
                builder: (context, state) => const PatientHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.patientFavoriteScreen,
                builder: (context, state) => const AppScaffold(
                  child: Center(
                    child: Text("Favorites"),
                  ),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.patientBookingScreen,
                builder: (context, state) => const AppScaffold(
                  child: Center(
                    child: Text("Bookings"),
                  ),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.patientConversationsScreen,
                builder: (context, state) => const AppScaffold(
                  child: Center(
                    child: Text("conversations"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.patientDoctorDetailsScreen,
        builder: (context, state) => const PatientDoctorDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.patientFindDoctorsScreen,
        builder: (context, state) => const PatientFindDoctorsScreen(),
      ),
      GoRoute(
        path: AppRoutes.patientAppointmentScreen,
        builder: (context, state) => const PatientAppointmentScreen(),
      ),
    ],
  );
}
