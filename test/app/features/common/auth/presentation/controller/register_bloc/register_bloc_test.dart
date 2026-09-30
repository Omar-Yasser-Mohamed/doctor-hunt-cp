import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/register_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/register_bloc/register_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

class FakeRegisterRequest extends Fake implements RegisterRequest {}

void main() {
  late AuthRepo authRepo;
  late RegisterBloc registerBloc;

  setUpAll(() {
    authRepo = MockAuthRepo();
    LocaleSettings.setLocale(AppLocale.en);
  });

  setUp(() {
    registerBloc = RegisterBloc(authRepo);
    registerFallbackValue(FakeRegisterRequest());
  });

  final password = 'Omar123!';

  final user = UserModel(
    id: '1',
    email: 'omar@gmail.com',
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

  group("register bloc test", () {
    blocTest(
      "register success",
      build: () {
        when(
          () => authRepo.signUp(any()),
        ).thenAnswer(
          (_) async => Right(user),
        );
        return registerBloc;
      },
      act: (bloc) {
        bloc.add(
          RegisterSubmitted(
            email: user.email,
            name: user.name,
            password: password,
            userRole: user.userRole,
          ),
        );
      },
      expect: () => [
        RegisterLoading(),
        RegisterSuccess(user),
      ],
      verify: (_) {
        verify(
          () => authRepo.signUp(any()),
        ).called(1);
      },
    );

    blocTest(
      "register failure",
      build: () {
        when(
          () => authRepo.signUp(any()),
        ).thenAnswer(
          (_) async => Left(failure),
        );
        return registerBloc;
      },
      act: (bloc) {
        bloc.add(
          RegisterSubmitted(
            email: user.email,
            name: user.name,
            password: password,
            userRole: user.userRole,
          ),
        );
      },
      expect: () => [
        RegisterLoading(),
        RegisterFailure(failure),
      ],
      verify: (_) {
        verify(
          () => authRepo.signUp(any()),
        ).called(1);
      },
    );
  });
}
