part of 'forget_password_bloc.dart';

sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final String email;
  ForgetPasswordSuccess(this.email);
}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String failure;
  ForgetPasswordFailure(this.failure);
}

final class VerifyOtpLoading extends ForgetPasswordState {}

final class VerifyOtpSuccess extends ForgetPasswordState {}

final class ResetPasswordLoading extends ForgetPasswordState {}

final class ResetPasswordSuccess extends ForgetPasswordState {}
