import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/user_model.dart';
import 'package:doctor_hunt/app/features/common/auth/data/models/login_request.dart';
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo _authRepo;

  LoginBloc(this._authRepo) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLogin);
  }

  Future<void> _onLogin(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final result = await _authRepo.login(
      LoginRequest(
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(LoginFailure(failure)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}
