import 'package:doctor_hunt/app/core/error/error_handler.dart';
import 'package:doctor_hunt/app/core/error/failure.dart';
import 'package:doctor_hunt/app/core/utils/either.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImagePickerService {
  final ImagePicker _picker;

  ImagePickerService(this._picker);

  Future<Either<Failure, XFile?>> pickImage({
    ImageSource source = ImageSource.gallery,
  }) async {
    try {
      final image = await _picker.pickImage(
        source: source,
        requestFullMetadata: false,
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      return Right(image);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}