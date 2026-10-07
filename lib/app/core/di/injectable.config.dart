// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:doctor_hunt/app/core/app_events/app_event_bus.dart' as _i275;
import 'package:doctor_hunt/app/core/di/di_module.dart' as _i984;
import 'package:doctor_hunt/app/core/shared/services/image_picker_service.dart'
    as _i873;
import 'package:doctor_hunt/app/core/shared/services/storage_service.dart'
    as _i755;
import 'package:doctor_hunt/app/core/shared/services/supabase_storage_service.dart'
    as _i155;
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/data/repos/admin_doctor_availability_repo.dart'
    as _i563;
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/data/repos/admin_doctor_availability_repo_impl.dart'
    as _i198;
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/data/services/admin_doctor_availability_service.dart'
    as _i562;
import 'package:doctor_hunt/app/features/admin/admin_doctor_availability/presentation/controller/doctor_availability_bloc/doctor_availability_bloc.dart'
    as _i804;
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/data/repos/admin_doctor_details_repo.dart'
    as _i648;
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/data/services/admin_doctor_details_service.dart'
    as _i636;
import 'package:doctor_hunt/app/features/admin/admin_doctor_details/presentation/controller/bloc/admin_doctor_details_bloc.dart'
    as _i1051;
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/repos/doctor_management_repo.dart'
    as _i488;
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/repos/doctor_management_repo_impl.dart'
    as _i528;
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/data/services/doctor_management_service.dart'
    as _i40;
import 'package:doctor_hunt/app/features/admin/admin_doctor_manager/presentation/controller/doctor_management_bloc/doctor_management_bloc.dart'
    as _i248;
import 'package:doctor_hunt/app/features/admin/admin_doctors/data/repos/admin_doctors_repo.dart'
    as _i892;
import 'package:doctor_hunt/app/features/admin/admin_doctors/data/repos/admin_doctors_repo_impl.dart'
    as _i319;
import 'package:doctor_hunt/app/features/admin/admin_doctors/data/services/admin_doctors_service.dart'
    as _i154;
import 'package:doctor_hunt/app/features/admin/admin_doctors/presentation/controller/admin_doctors_bloc/admin_doctors_bloc.dart'
    as _i325;
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
import 'package:doctor_hunt/app/features/common/user/data/repos/user_repo.dart'
    as _i347;
import 'package:doctor_hunt/app/features/common/user/data/repos/user_repo_impl.dart'
    as _i597;
import 'package:doctor_hunt/app/features/common/user/data/services/user_local_service.dart'
    as _i208;
import 'package:doctor_hunt/app/features/common/user/presentation/controller/bloc/user_bloc.dart'
    as _i716;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i737.ChooseRoleBloc>(() => _i737.ChooseRoleBloc());
    gh.singleton<_i275.AppEventBus>(() => _i275.AppEventBus());
    gh.lazySingleton<_i454.SupabaseClient>(() => appModule.supabaseClient);
    gh.lazySingleton<_i116.GoogleSignIn>(() => appModule.googleSignIn);
    gh.lazySingleton<_i183.ImagePicker>(() => appModule.imagePicker);
    await gh.lazySingletonAsync<_i755.StorageService>(
      () => _i755.StorageService.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i636.AdminDoctorDetailsService>(
      () => _i636.AdminDoctorDetailsServiceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i208.UserLocalService>(
      () => _i208.UserLocalServiceImpl(gh<_i755.StorageService>()),
    );
    gh.lazySingleton<_i562.AdminDoctorAvailabilityService>(
      () =>
          _i562.AdminDoctorAvailabilityServiceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i722.AuthService>(
      () => _i722.AuthServiceImpl(
        gh<_i454.SupabaseClient>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.lazySingleton<_i154.AdminDoctorsService>(
      () => _i154.AdminDoctorsServiceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i155.SupabaseStorageService>(
      () => _i155.SupabaseStorageService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i40.DoctorManagementService>(
      () => _i40.DoctorManagementServiceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i488.DoctorManagementRepo>(
      () => _i528.DoctorManagementRepoImpl(gh<_i40.DoctorManagementService>()),
    );
    gh.lazySingleton<_i873.ImagePickerService>(
      () => _i873.ImagePickerService(gh<_i183.ImagePicker>()),
    );
    gh.lazySingleton<_i619.AuthRepo>(
      () => _i409.AuthRepoImpl(
        gh<_i722.AuthService>(),
        gh<_i208.UserLocalService>(),
      ),
    );
    gh.lazySingleton<_i347.UserRepo>(
      () => _i597.UserRepoImpl(gh<_i208.UserLocalService>()),
    );
    gh.lazySingleton<_i648.AdminDoctorDetailsRepo>(
      () => _i648.AdminDoctorDetailsRepoImpl(
        gh<_i636.AdminDoctorDetailsService>(),
      ),
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
    gh.lazySingleton<_i563.AdminDoctorAvailabilityRepo>(
      () => _i198.AdminDoctorAvailabilityRepoImpl(
        gh<_i562.AdminDoctorAvailabilityService>(),
      ),
    );
    gh.factory<_i1051.AdminDoctorDetailsBloc>(
      () => _i1051.AdminDoctorDetailsBloc(
        gh<_i648.AdminDoctorDetailsRepo>(),
        gh<_i275.AppEventBus>(),
      ),
    );
    gh.lazySingleton<_i892.AdminDoctorsRepo>(
      () => _i319.AdminDoctorsRepoImpl(gh<_i154.AdminDoctorsService>()),
    );
    gh.factory<_i248.DoctorManagementBloc>(
      () => _i248.DoctorManagementBloc(
        gh<_i488.DoctorManagementRepo>(),
        gh<_i873.ImagePickerService>(),
        gh<_i275.AppEventBus>(),
      ),
    );
    gh.lazySingleton<_i716.UserBloc>(
      () => _i716.UserBloc(gh<_i347.UserRepo>()),
    );
    gh.factory<_i804.DoctorAvailabilityBloc>(
      () =>
          _i804.DoctorAvailabilityBloc(gh<_i563.AdminDoctorAvailabilityRepo>()),
    );
    gh.factory<_i325.AdminDoctorsBloc>(
      () => _i325.AdminDoctorsBloc(
        gh<_i892.AdminDoctorsRepo>(),
        gh<_i275.AppEventBus>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i984.AppModule {}
