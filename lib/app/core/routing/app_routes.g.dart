// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $splashRoute,
  $onboardingRoute,
  $chooseRoleRoute,
  $loginRoute,
  $registerRoute,
  $patientShellRouteData,
  $patientDoctorDetailsRoute,
  $patientFindDoctorsRoute,
  $patientAppointmentRoute,
];

RouteBase get $splashRoute => GoRouteData.$route(
  path: '/',
  hasOverriddenOnExit: false,
  factory: $SplashRoute._fromState,
);

mixin $SplashRoute on GoRouteData {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboardingRoute => GoRouteData.$route(
  path: '/onboarding',
  hasOverriddenOnExit: false,
  factory: $OnboardingRoute._fromState,
);

mixin $OnboardingRoute on GoRouteData {
  static OnboardingRoute _fromState(GoRouterState state) =>
      const OnboardingRoute();

  @override
  String get location => GoRouteData.$location('/onboarding');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $chooseRoleRoute => GoRouteData.$route(
  path: '/chooseRole',
  hasOverriddenOnExit: false,
  factory: $ChooseRoleRoute._fromState,
);

mixin $ChooseRoleRoute on GoRouteData {
  static ChooseRoleRoute _fromState(GoRouterState state) =>
      const ChooseRoleRoute();

  @override
  String get location => GoRouteData.$location('/chooseRole');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',
  hasOverriddenOnExit: false,
  factory: $LoginRoute._fromState,
);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registerRoute => GoRouteData.$route(
  path: '/register',
  hasOverriddenOnExit: false,
  factory: $RegisterRoute._fromState,
);

mixin $RegisterRoute on GoRouteData {
  static RegisterRoute _fromState(GoRouterState state) => const RegisterRoute();

  @override
  String get location => GoRouteData.$location('/register');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $patientShellRouteData => StatefulShellRouteData.$route(
  factory: $PatientShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/patientHome',
          hasOverriddenOnExit: false,
          factory: $PatientHomeRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/patientFavorite',
          hasOverriddenOnExit: false,
          factory: $PatientFavoriteRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/patientBooking',
          hasOverriddenOnExit: false,
          factory: $PatientBookingRoute._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/patientConversations',
          hasOverriddenOnExit: false,
          factory: $PatientConversationsRoute._fromState,
        ),
      ],
    ),
  ],
);

extension $PatientShellRouteDataExtension on PatientShellRouteData {
  static PatientShellRouteData _fromState(GoRouterState state) =>
      const PatientShellRouteData();
}

mixin $PatientHomeRoute on GoRouteData {
  static PatientHomeRoute _fromState(GoRouterState state) =>
      const PatientHomeRoute();

  @override
  String get location => GoRouteData.$location('/patientHome');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PatientFavoriteRoute on GoRouteData {
  static PatientFavoriteRoute _fromState(GoRouterState state) =>
      const PatientFavoriteRoute();

  @override
  String get location => GoRouteData.$location('/patientFavorite');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PatientBookingRoute on GoRouteData {
  static PatientBookingRoute _fromState(GoRouterState state) =>
      const PatientBookingRoute();

  @override
  String get location => GoRouteData.$location('/patientBooking');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PatientConversationsRoute on GoRouteData {
  static PatientConversationsRoute _fromState(GoRouterState state) =>
      const PatientConversationsRoute();

  @override
  String get location => GoRouteData.$location('/patientConversations');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $patientDoctorDetailsRoute => GoRouteData.$route(
  path: '/patientDoctorDetails',
  hasOverriddenOnExit: false,
  factory: $PatientDoctorDetailsRoute._fromState,
);

mixin $PatientDoctorDetailsRoute on GoRouteData {
  static PatientDoctorDetailsRoute _fromState(GoRouterState state) =>
      const PatientDoctorDetailsRoute();

  @override
  String get location => GoRouteData.$location('/patientDoctorDetails');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $patientFindDoctorsRoute => GoRouteData.$route(
  path: '/patientFindDoctors',
  hasOverriddenOnExit: false,
  factory: $PatientFindDoctorsRoute._fromState,
);

mixin $PatientFindDoctorsRoute on GoRouteData {
  static PatientFindDoctorsRoute _fromState(GoRouterState state) =>
      const PatientFindDoctorsRoute();

  @override
  String get location => GoRouteData.$location('/patientFindDoctors');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $patientAppointmentRoute => GoRouteData.$route(
  path: '/patientAppointment',
  hasOverriddenOnExit: false,
  factory: $PatientAppointmentRoute._fromState,
);

mixin $PatientAppointmentRoute on GoRouteData {
  static PatientAppointmentRoute _fromState(GoRouterState state) =>
      const PatientAppointmentRoute();

  @override
  String get location => GoRouteData.$location('/patientAppointment');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
