part of 'choose_role_bloc.dart';

sealed class ChooseRoleEvent {}

final class SelectRole extends ChooseRoleEvent {
  final UserRole userRole;
  SelectRole({required this.userRole});
}
