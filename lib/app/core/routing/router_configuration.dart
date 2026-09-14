import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/core/widgets/app_background.dart';
import 'package:doctor_hunt/app/core/widgets/app_nav_bar.dart';
import 'package:doctor_hunt/app/features/auth/presentation/screens/choose_role_screen.dart';
import 'package:doctor_hunt/app/features/auth/presentation/screens/login_screen.dart';
import 'package:doctor_hunt/app/features/auth/presentation/screens/register_screen.dart';
import 'package:doctor_hunt/app/features/home/presentation/screens/home_screen.dart';
import 'package:doctor_hunt/app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:doctor_hunt/app/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract final class RouterConfiguration {
  static final router = GoRouter(
    initialLocation: AppRoutes.homeScreen, //TODO:: Change it to splash after finish the task
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
                  child:  Scaffold(
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
                  child:  Scaffold(
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
                  child:  Scaffold(
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
    ],
  );
}
