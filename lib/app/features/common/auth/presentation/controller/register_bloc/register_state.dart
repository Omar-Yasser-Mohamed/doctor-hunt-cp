part of 'register_bloc.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final UserModel user;
  RegisterSuccess(this.user);
}

final class RegisterFailure extends RegisterState {
  final Failure failure;
  RegisterFailure(this.failure);
}
