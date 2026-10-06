import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class SupabaseStorageService {
  SupabaseStorageService(this._supabaseClient);

  final SupabaseClient _supabaseClient;

  Future<String> uploadImage({
    required File file,
    required String path,
    required String bucket,
  }) async {
    await _supabaseClient.storage.from(bucket).upload(path, file);

    return _supabaseClient.storage.from(bucket).getPublicUrl(path);
  }

  Future<void> deleteImage({
    required String path,
    required String bucket,
  }) async {
    await _supabaseClient.storage.from(bucket).remove([path]);
  }
}
