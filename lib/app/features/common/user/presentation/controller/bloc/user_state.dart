part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

final class UserInitial extends UserState {
  const UserInitial();
}

final class UserLoading extends UserState {
  const UserLoading();
}

final class UserSuccess extends UserState {
  final CurrentUserModel user;

  const UserSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

final class UserEmpty extends UserState {
  const UserEmpty();
}

final class UserFailure extends UserState {
  final Failure failure;

  const UserFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
