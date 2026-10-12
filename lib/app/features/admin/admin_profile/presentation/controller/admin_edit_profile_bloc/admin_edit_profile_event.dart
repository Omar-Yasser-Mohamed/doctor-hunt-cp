part of 'admin_edit_profile_bloc.dart';

sealed class AdminEditProfileEvent extends Equatable {
  const AdminEditProfileEvent();

  @override
  List<Object?> get props => [];
}

final class AdminEditProfileInitialized extends AdminEditProfileEvent {
  final CurrentUserModel currentUser;

  const AdminEditProfileInitialized(this.currentUser);

  @override
  List<Object?> get props => [currentUser];
}

final class AdminEditProfileNameChanged extends AdminEditProfileEvent {
  final String name;

  const AdminEditProfileNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

final class AdminEditProfilePickImage extends AdminEditProfileEvent {
  final ImageSource source;

  const AdminEditProfilePickImage(this.source);

  @override
  List<Object?> get props => [source];
}

final class AdminEditProfileLocationChanged extends AdminEditProfileEvent {
  final LocationModel location;

  const AdminEditProfileLocationChanged(this.location);

  @override
  List<Object?> get props => [location];
}

final class AdminEditProfileSubmitted extends AdminEditProfileEvent {
  const AdminEditProfileSubmitted();
}
