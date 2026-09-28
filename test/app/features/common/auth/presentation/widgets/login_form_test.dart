import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/core/widgets/app_button.dart';
import 'package:doctor_hunt/app/core/widgets/app_text_field.dart';
import 'package:doctor_hunt/app/features/admin/admin_test_screen.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/login_bloc/login_bloc.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/widgets/login_form.dart';
import 'package:doctor_hunt/app/features/patient/patient_home/presentation/screens/patient_home_screen.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class FakeLoginRequest extends Fake implements LoginEvent {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockLoginBloc loginBloc;
  late GoRouter testRouter;

  setUp(() {
    loginBloc = MockLoginBloc();

    testRouter = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) {
            return BlocProvider<LoginBloc>.value(
              value: loginBloc,
              child: const Scaffold(
                body: LoginForm(),
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

    when(() => loginBloc.state).thenReturn(LoginInitial());
  });

  setUpAll(() {
    registerFallbackValue(FakeLoginRequest());
  });

  tearDown(() {
    loginBloc.close();
  });

  Widget makeTestableWidget({
    required LoginBloc loginBloc,
  }) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp.router(
        routerConfig: testRouter,
        builder: (context, child) {
          return BlocProvider<LoginBloc>.value(
            value: loginBloc,
            child: child,
          );
        },
      ),
    );
  }

  testWidgets('login form render success', (tester) async {
    await tester.pumpWidget(makeTestableWidget(loginBloc: loginBloc));
    expect(find.byType(AppTextField), findsNWidgets(2));
    expect(find.byType(AppButton), findsOneWidget);
  });

  testWidgets(
    'invalid validation',
    (tester) async {
      await tester.pumpWidget(
        makeTestableWidget(
          loginBloc: loginBloc,
        ),
      );

      await tester.tap(find.byType(AppButton));
      await tester.pump();

      verifyNever(
        () => loginBloc.add(any()),
      );
    },
  );

  testWidgets(
    'submit login when form is valid',
    (tester) async {
      await tester.pumpWidget(
        makeTestableWidget(
          loginBloc: loginBloc,
        ),
      );

      final textFields = find.byType(AppTextField);

      await tester.enterText(
        textFields.at(0),
        'omar@gmail.com',
      );

      await tester.enterText(
        textFields.at(1),
        'Omar123!',
      );

      await tester.tap(find.byType(AppButton));

      verify(
        () => loginBloc.add(
          LoginSubmitted(email: "omar@gmail.com", password: "Omar123!"),
        ),
      ).called(1);
    },
  );

  testWidgets(
    'passes loading state to AppButton to showing loading indecator',
    (tester) async {
      when(() => loginBloc.state).thenReturn(LoginLoading());

      await tester.pumpWidget(
        makeTestableWidget(loginBloc: loginBloc),
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
        loginBloc,
        Stream.fromIterable([
          LoginLoading(),
          LoginFailure(failure),
        ]),
        initialState: LoginInitial(),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          loginBloc: loginBloc,
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
    'navigate to patient home on success login',
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
        loginBloc,
        Stream.fromIterable([
          LoginLoading(),
          LoginSuccess(user),
        ]),
        initialState: LoginInitial(),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          loginBloc: loginBloc,
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
    'navigate to admin home on success login',
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
        loginBloc,
        Stream.fromIterable([
          LoginLoading(),
          LoginSuccess(user),
        ]),
        initialState: LoginInitial(),
      );

      await tester.pumpWidget(
        makeTestableWidget(
          loginBloc: loginBloc,
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
