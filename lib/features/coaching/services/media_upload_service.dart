import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mesmer_app/core/config/supabase_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

enum MediaType { image, video, document }

final mediaUploadServiceProvider = Provider<MediaUploadService>(
  (ref) => MediaUploadService(Supabase.instance.client),
);

class MediaUploadService {
  MediaUploadService(this._client);

  final SupabaseClient _client;
  final _picker = ImagePicker();

  /// Pick and upload media, returns Supabase public URL or null if cancelled.
  Future<String?> pickAndUpload({
    required MediaType type,
    required String sessionId,
  }) async {
    switch (type) {
      case MediaType.image:
        return _pickAndUploadImage(sessionId);
      case MediaType.video:
        return _pickAndUploadVideo(sessionId);
      case MediaType.document:
        return _pickAndUploadDocument(sessionId);
    }
  }

  Future<String?> _pickAndUploadImage(String sessionId) async {
    final picked = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxWidth: 1920,
      maxHeight: 1080,
    );
    if (picked == null) return null;

    // Compress image for low-bandwidth environments
    final tmpDir = await getTemporaryDirectory();
    final compressed = await FlutterImageCompress.compressAndGetFile(
      picked.path,
      p.join(tmpDir.path, '${DateTime.now().millisecondsSinceEpoch}_c.jpg'),
      quality: 60,
      minWidth: 800,
      minHeight: 600,
    );

    final file = compressed ?? XFile(picked.path);
    return _uploadToSupabase(
      filePath: file.path,
      sessionId: sessionId,
      bucket: SupabaseConfig.evidenceBucket,
      extension: 'jpg',
    );
  }

  Future<String?> _pickAndUploadVideo(String sessionId) async {
    final picked = await _picker.pickVideo(
      source: ImageSource.gallery,
      maxDuration: const Duration(minutes: 5),
    );
    if (picked == null) return null;

    // For videos, we upload as-is (video_compress often requires platform setup)
    // In production, video_compress would be applied here
    return _uploadToSupabase(
      filePath: picked.path,
      sessionId: sessionId,
      bucket: SupabaseConfig.evidenceBucket,
      extension: 'mp4',
    );
  }

  Future<String?> _pickAndUploadDocument(String sessionId) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xlsx', 'png', 'jpg'],
      allowMultiple: false,
    );
    if (result == null || result.files.isEmpty) return null;

    final file = result.files.first;
    if (file.path == null) return null;

    return _uploadToSupabase(
      filePath: file.path!,
      sessionId: sessionId,
      bucket: SupabaseConfig.documentsBucket,
      extension: file.extension ?? 'bin',
    );
  }

  /// Uploads with exponential-backoff retry (max 3 attempts).
  Future<String?> _uploadToSupabase({
    required String filePath,
    required String sessionId,
    required String bucket,
    required String extension,
  }) async {
    final fileName =
        'sessions/$sessionId/${DateTime.now().millisecondsSinceEpoch}.$extension';
    const maxAttempts = 3;
    int attempt = 0;
    int delay = 1;

    while (attempt < maxAttempts) {
      try {
        await _client.storage.from(bucket).upload(
              fileName,
              File(filePath),
              fileOptions: const FileOptions(upsert: true),
            );
        return _client.storage.from(bucket).getPublicUrl(fileName);
      } catch (e) {
        attempt++;
        if (attempt >= maxAttempts) rethrow;
        await Future.delayed(Duration(seconds: delay));
        delay *= 2; // exponential back-off
      }
    }
    return null;
  }
}
