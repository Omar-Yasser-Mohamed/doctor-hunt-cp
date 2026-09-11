import 'package:doctor_hunt/app/core/routing/app_routes.dart';
import 'package:doctor_hunt/app/features/splash/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class RouterConfiguration {
  static final router = GoRouter(
    initialLocation: AppRoutes.splashRoute,
    routes: [
      GoRoute(
        path: AppRoutes.splashRoute,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
