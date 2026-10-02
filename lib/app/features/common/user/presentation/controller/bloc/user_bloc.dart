import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/features/common/user/data/repos/user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';
part 'user_state.dart';

@lazySingleton
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _userRepo;

  UserBloc(this._userRepo) : super(const UserInitial()) {
    on<GetUserEvent>(_onGetUser);
    on<SaveUserEvent>(_onSaveUser);
    on<UpdateUserEvent>(_onUpdateUser);
    on<RemoveUserEvent>(_onRemoveUser);
  }

  CurrentUserModel? _user;
  CurrentUserModel? get user => _user;

  Future<void> _onGetUser(
    GetUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());
    final result = await _userRepo.getUser();
    result.fold(
      (failure) => emit(UserFailure(failure)),
      (user) {
        if (user != null) {
          _user = user;
          emit(UserSuccess(user));
        } else {
          _user = null;
          emit(const UserEmpty());
        }
      },
    );
  }

  Future<void> _onSaveUser(
    SaveUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());
    final result = await _userRepo.saveUser(event.user);
    result.fold(
      (failure) => emit(UserFailure(failure)),
      (_) {
        _user = event.user;
        emit(UserSuccess(event.user));
      },
    );
  }

  Future<void> _onUpdateUser(
    UpdateUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());
    final result = await _userRepo.saveUser(event.user);
    result.fold(
      (failure) => emit(UserFailure(failure)),
      (_) {
        _user = event.user;
        emit(UserSuccess(event.user));
      },
    );
  }

  Future<void> _onRemoveUser(
    RemoveUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());
    final result = await _userRepo.removeUser();
    result.fold(
      (failure) => emit(UserFailure(failure)),
      (_) {
        _user = null;
        emit(const UserEmpty());
      },
    );
  }
}
