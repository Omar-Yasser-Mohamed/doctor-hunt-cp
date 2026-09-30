import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/admin/admin_test_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/register_bloc/register_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/register_form.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/screens/patient_home_screen.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState>
    implements RegisterBloc {}

class FakeRegisterRequest extends Fake implements RegisterEvent {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockRegisterBloc registerBloc;
  late GoRouter testRouter;

  setUp(() {
    registerBloc = MockRegisterBloc();

    testRouter = GoRouter(
      initialLocation: '/register',
      initialExtra: UserRole.patient,
      routes: [
        GoRoute(
          path: '/register',
          builder: (context, state) {
            return BlocProvider<RegisterBloc>.value(
              value: registerBloc,
              child: const Scaffold(
                body: RegisterForm(),
              ),
            );
          },
        ),
        GoRoute(
          path: '/patientHome',
          builder: (context, state) {
            return const PatientHomeScreen();
          },
        ),
        GoRoute(
          path: '/adminTest',
          builder: (context, state) {
            return const AdminTestScreen();
          },
        ),
      ],
    );

    when(() => registerBloc.state).thenReturn(RegisterInitial());
  });

  setUpAll(() {
    registerFallbackValue(FakeRegisterRequest());
    LocaleSettings.setLocale(AppLocale.en);
  });

  tearDown(() {
    registerBloc.close();
  });

  Widget makeTestableWidget({
    required RegisterBloc registerBloc,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        routerConfig: testRouter,
        builder: (context, child) {
          return BlocProvider<RegisterBloc>.value(
            value: registerBloc,
            child: child,
          );
        },
      ),
    );
  }

  testWidgets('register form render success', (tester) async {
    await tester.pumpWidget(makeTestableWidget(registerBloc: registerBloc));
    expect(find.byType(AppTextField), findsNWidgets(3));
    expect(find.byType(TermsAgreeButton), findsOneWidget);
    expect(find.byType(AppButton), findsOneWidget);
  });

  testWidgets(
    'invalid validation',
    (tester) async {
      await tester.pumpWidget(
        makeTestableWidget(
          registerBloc: registerBloc,
        ),
      );

      // Agree to terms so button becomes active
      await tester.tap(find.byType(TermsAgreeButton));
      await tester.pump();

      await tester.tap(find.byType(AppButton));
      await tester.pump();

      verifyNever(
        () => registerBloc.add(any()),
      );
    },
  );

  testWidgets(
    'submit register when form is valid',
    (tester) async {
      await tester.pumpWidget(
        makeTestableWidget(
          registerBloc: registerBloc,
        ),
      );

      final textFields = find.byType(AppTextField);

      await tester.enterText(
        textFields.at(0),
        'Omar',
      );

      await tester.enterText(
        textFields.at(1),
        'omar@gmail.com',
      );

      await tester.enterText(
        textFields.at(2),
        'Omar123!',
      );

      await tester.tap(find.byType(TermsAgreeButton));
      await tester.pump();

      await tester.tap(find.byType(AppButton));
      await tester.pump();

      verify(
        () => registerBloc.add(
          RegisterSubmitted(
            email: "omar@gmail.com",
            name: "Omar",
            password: 'Omar123!',
            userRole: UserRole.patient,
          ),
        ),
      ).called(1);
    },
  );

  testWidgets(
    'passes loading state to AppButton to showing loading indecator',
    (tester) async {
      when(() => registerBloc.state).thenReturn(RegisterLoading());

      await tester.pumpWidget(
        makeTestableWidget(registerBloc: registerBloc),
      );

      final button = tester.widget<AppButton>(
        find.byType(AppButton),
      );

      expect(button.isLoading, isTrue);
    },
  );

  testWidgets(
    'showing snake bar in failure state',
    (tester) async {
      final failure = AppFailure(
        message: t.errors.userNotFound,
        code: FailureCode.userNotFound,
      );

      whenListen(
        registerBloc,
        Stream.fromIterable([
          RegisterLoading(),
          RegisterFailure(failure),
        ]),
        initialState: RegisterInitial(),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          registerBloc: registerBloc,
        ),
      );

      await tester.pump();
      await tester.pump();

      expect(
        find.text(t.errors.userNotFound),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'navigate to patient home on success register',
    (tester) async {
      tester.view.physicalSize = const Size(375, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final user = UserModel(
        id: '1',
        email: 'omar@gmail.com',
        name: 'Omar',
        userRole: UserRole.patient,
        image: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      whenListen(
        registerBloc,
        Stream.fromIterable([
          RegisterLoading(),
          RegisterSuccess(user),
        ]),
        initialState: RegisterInitial(),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          registerBloc: registerBloc,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byType(PatientHomeScreen),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'navigate to admin home on success register',
    (tester) async {
      tester.view.physicalSize = const Size(375, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final user = UserModel(
        id: '1',
        email: 'omar@gmail.com',
        name: 'Omar',
        userRole: UserRole.admin,
        image: null,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      whenListen(
        registerBloc,
        Stream.fromIterable([
          RegisterLoading(),
          RegisterSuccess(user),
        ]),
        initialState: RegisterInitial(),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          registerBloc: registerBloc,
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byType(AdminTestScreen),
        findsOneWidget,
      );
    },
  );
}
