import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/error/failure_code.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/google_bloc/google_bloc.dart';
import 'package:doctor_hunt/generated/translations.g.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late AuthRepo authRepo;
  late GoogleBloc googleBloc;

  setUpAll(() {
    authRepo = MockAuthRepo();
    LocaleSettings.setLocale(AppLocale.en);
  });

  setUp(() {
    googleBloc = GoogleBloc(authRepo);
  });

  final user = CurrentUserModel(
    user: UserModel(
      id: '1',
      email: 'omar@gmail.com',
      name: 'name',
      userRole: UserRole.patient,
      image: null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  );

  final failure = AppFailure(
    message: t.errors.notFound,
    code: FailureCode.notFound,
  );

  group('google bloc tests', () {
    blocTest(
      'google success',
      build: () {
        when(
          () => authRepo.signInWithGoogle(),
        ).thenAnswer(
          (_) async => Right(user),
        );
        return googleBloc;
      },
      act: (bloc) {
        bloc.add(GoogleSubmitted());
      },
      expect: () => [
        GoogleLoading(),
        GoogleSuccess(user),
      ],
      verify: (_) {
        verify(
          () => authRepo.signInWithGoogle(),
        ).called(1);
      },
    );

    blocTest(
      'google failure',
      build: () {
        when(
          () => authRepo.signInWithGoogle(),
        ).thenAnswer(
          (_) async => Left(failure),
        );
        return googleBloc;
      },
      act: (bloc) {
        bloc.add(GoogleSubmitted());
      },
      expect: () => [
        GoogleLoading(),
        GoogleFailure(failure: failure),
      ],
      verify: (_) {
        verify(
          () => authRepo.signInWithGoogle(),
        ).called(1);
      },
    );
  });
}
