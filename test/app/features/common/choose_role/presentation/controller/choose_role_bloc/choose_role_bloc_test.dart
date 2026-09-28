import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/app/core/shared/enums/user_role.dart';
import 'package:doctor_hunt/app/features/common/choose_role/presentation/controller/choose_role_bloc/choose_role_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ChooseRoleBloc chooseRoleBloc;

  setUp(() {
    chooseRoleBloc = ChooseRoleBloc();
  });

  tearDown(() {
    chooseRoleBloc.close();
  });

  group('ChooseRoleBloc', () {
    test('initial state', () {
      expect(chooseRoleBloc.state, UserRole.patient);
    });

    blocTest<ChooseRoleBloc, UserRole>(
      'when select role as a admin',
      build: () => chooseRoleBloc,
      act: (bloc) => bloc.add(SelectRole(userRole: UserRole.admin)),
      expect: () => [UserRole.admin],
    );

    blocTest<ChooseRoleBloc, UserRole>(
      'when select same role as a patient',
      build: () => chooseRoleBloc,
      act: (bloc) => bloc.add(SelectRole(userRole: UserRole.patient)),
      expect: () => <UserRole>[],
    );

    blocTest<ChooseRoleBloc, UserRole>(
      'toggling role between admin and patient',
      build: () => chooseRoleBloc,
      act: (bloc) {
        bloc.add(SelectRole(userRole: UserRole.admin));
        bloc.add(SelectRole(userRole: UserRole.patient));
      },
      expect: () => [UserRole.admin, UserRole.patient],
    );

    blocTest<ChooseRoleBloc, UserRole>(
      'when select same role',
      build: () => chooseRoleBloc,
      act: (bloc) {
        bloc.add(SelectRole(userRole: UserRole.admin));
        bloc.add(SelectRole(userRole: UserRole.admin));
      },
      expect: () => [UserRole.admin],
    );
  });
}
