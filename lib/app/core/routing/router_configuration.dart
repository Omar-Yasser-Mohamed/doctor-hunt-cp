import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/features/auth/presentation/screens/choose_role_screen.dart';
import 'package:doctor_hunt/app/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:doctor_hunt/app/features/splash/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class RouterConfiguration {
  static final router = GoRouter(
    initialLocation: AppRoutes.splashScreen,
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
    ],
  );
}
