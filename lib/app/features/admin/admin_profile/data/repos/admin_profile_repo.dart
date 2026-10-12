import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/shared/models/current_user_model.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:doctor_hunt/app/features/admin/admin_profile/data/models/update_admin_profile.dart';

abstract class AdminProfileRepo {
  Future<Either<Failure, CurrentUserModel>> updateAdminProfile(
    UpdateAdminProfileRequest request,
  );
}
