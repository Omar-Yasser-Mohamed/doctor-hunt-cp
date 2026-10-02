part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

final class GetUserEvent extends UserEvent {
  const GetUserEvent();
}

final class SaveUserEvent extends UserEvent {
  final CurrentUserModel user;

  const SaveUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}

final class UpdateUserEvent extends UserEvent {
  final CurrentUserModel user;

  const UpdateUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}

final class RemoveUserEvent extends UserEvent {
  const RemoveUserEvent();
}
