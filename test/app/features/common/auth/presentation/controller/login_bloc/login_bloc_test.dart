import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/login_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/login_bloc/login_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

class FakeLoginRequest extends Fake implements LoginRequest {}

void main() {
  late MockAuthRepo mockAuthRepo;

  final email = 'omar@gmail.com';
  final password = 'Omar123!';

  final user = UserModel(
    id: '1',
    email: email,
    name: 'name',
    userRole: UserRole.patient,
    image: null,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  final failure = AppFailure(
    message: t.errors.notFound,
    code: FailureCode.notFound,
  );

  setUpAll(() {
    registerFallbackValue(FakeLoginRequest());
  });

  setUp(() {
    mockAuthRepo = MockAuthRepo();
  });

  group('LoginBloc', () {
    group('LoginSubmitted', () {
      blocTest<LoginBloc, LoginState>(
        "login success",
        build: () {
          when(
            () => mockAuthRepo.login(any()),
          ).thenAnswer(
            (_) async => Right(user),
          );

          return LoginBloc(mockAuthRepo);
        },
        act: (bloc) {
          bloc.add(
            LoginSubmitted(
              email: email,
              password: password,
            ),
          );
        },
        expect: () => [
          LoginLoading(),
          LoginSuccess(user),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepo.login(any()),
          ).called(1);
        },
      );

      blocTest(
        "login failure",
        build: () {
          when(
            () => mockAuthRepo.login(any()),
          ).thenAnswer(
            (_) async => Left(failure),
          );

          return LoginBloc(mockAuthRepo);
        },
        act: (bloc) {
          bloc.add(
            LoginSubmitted(
              email: email,
              password: password,
            ),
          );
        },
        expect: () => [
          LoginLoading(),
          LoginFailure(failure),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepo.login(any()),
          ).called(1);
        },
      );
    });
  });
}
