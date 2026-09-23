// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:doctor_hunt/app/core/di/di_module.dart' as _i984;
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo.dart'
    as _i619;
import 'package:doctor_hunt/app/features/common/auth/data/repo/auth_repo_impl.dart'
    as _i409;
import 'package:doctor_hunt/app/features/common/auth/data/service/auth_service.dart'
    as _i722;
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/forget_password_bloc/forget_password_bloc.dart'
    as _i378;
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/google_bloc/google_bloc.dart'
    as _i1039;
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/login_bloc/login_bloc.dart'
    as _i672;
import 'package:doctor_hunt/app/features/common/auth/presentation/controller/register_bloc/register_bloc.dart'
    as _i525;
import 'package:doctor_hunt/app/features/common/choose_role/presentation/controller/choose_role_bloc/choose_role_bloc.dart'
    as _i737;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i737.ChooseRoleBloc>(() => _i737.ChooseRoleBloc());
    gh.lazySingleton<_i454.SupabaseClient>(() => appModule.supabaseClient);
    gh.lazySingleton<_i116.GoogleSignIn>(() => appModule.googleSignIn);
    gh.lazySingleton<_i722.AuthService>(
      () => _i722.AuthServiceImpl(
        gh<_i454.SupabaseClient>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.lazySingleton<_i619.AuthRepo>(
      () => _i409.AuthRepoImpl(gh<_i722.AuthService>()),
    );
    gh.factory<_i378.ForgetPasswordBloc>(
      () => _i378.ForgetPasswordBloc(gh<_i619.AuthRepo>()),
    );
    gh.factory<_i1039.GoogleBloc>(
      () => _i1039.GoogleBloc(gh<_i619.AuthRepo>()),
    );
    gh.factory<_i672.LoginBloc>(() => _i672.LoginBloc(gh<_i619.AuthRepo>()));
    gh.factory<_i525.RegisterBloc>(
      () => _i525.RegisterBloc(gh<_i619.AuthRepo>()),
    );
    return this;
  }
}

class _$AppModule extends _i984.AppModule {}
