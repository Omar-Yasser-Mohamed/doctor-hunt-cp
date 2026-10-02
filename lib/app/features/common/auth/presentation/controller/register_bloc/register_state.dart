part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final CurrentUserModel user;
  RegisterSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

final class RegisterFailure extends RegisterState {
  final Failure failure;
  RegisterFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
