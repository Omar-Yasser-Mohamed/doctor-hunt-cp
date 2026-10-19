part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class SubmitChangePasswordEvent extends ChangePasswordEvent {
  final String currentPassword;
  final String newPassword;

  const SubmitChangePasswordEvent({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object> get props => [currentPassword, newPassword];
}
