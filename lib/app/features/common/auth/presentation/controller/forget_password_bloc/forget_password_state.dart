part of 'forget_password_bloc.dart';

sealed class ForgetPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final String email;
  ForgetPasswordSuccess(this.email);

  @override
  List<Object?> get props => [email];
}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final Failure failure;
  ForgetPasswordFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}

final class VerifyOtpLoading extends ForgetPasswordState {}

final class VerifyOtpSuccess extends ForgetPasswordState {}

final class ResetPasswordLoading extends ForgetPasswordState {}

final class ResetPasswordSuccess extends ForgetPasswordState {}
