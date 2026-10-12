part of 'admin_edit_profile_bloc.dart';

sealed class AdminEditProfileState extends Equatable {
  const AdminEditProfileState();

  @override
  List<Object?> get props => [];
}

final class AdminEditProfileInitial extends AdminEditProfileState {
  const AdminEditProfileInitial();
}

final class AdminEditProfileFormDirtyChanged extends AdminEditProfileState {
  final bool isDirty;

  const AdminEditProfileFormDirtyChanged({required this.isDirty});

  @override
  List<Object?> get props => [isDirty];
}

final class AdminEditProfileImagePicked extends AdminEditProfileState {
  final File file;

  const AdminEditProfileImagePicked(this.file);

  @override
  List<Object?> get props => [file.path];
}

final class AdminEditProfileLocationPicked extends AdminEditProfileState {
  final LocationModel location;

  const AdminEditProfileLocationPicked(this.location);

  @override
  List<Object?> get props => [location];
}

final class AdminEditProfileLoading extends AdminEditProfileState {
  const AdminEditProfileLoading();
}

final class AdminEditProfileSuccess extends AdminEditProfileState {
  final CurrentUserModel user;

  const AdminEditProfileSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

final class AdminEditProfileFailure extends AdminEditProfileState {
  final Failure failure;

  const AdminEditProfileFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
