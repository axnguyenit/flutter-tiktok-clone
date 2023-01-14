import 'dart:io';

typedef OnUploadInProgress = void Function(double);
typedef OnDownloadInProgress = void Function(double);
typedef OnUploadingCanceled = Future<bool> Function();

class StorageController {
  OnUploadingCanceled? _onUploadingCanceled;

  StorageController();

  set onUploadingCanceled(OnUploadingCanceled uploadingCanceled) {
    _onUploadingCanceled = uploadingCanceled;
  }

  Future<bool> cancelUploading() async {
    if (_onUploadingCanceled != null) {
      return _onUploadingCanceled!();
    }
    return false;
  }
}

abstract class StorageService {
  Future<String?> uploadVideo(
    String userId, {
    required File video,
    required String videoName,
    OnUploadInProgress? uploading,
  });

  Future<String?> downloadAndSaveVideoToTempDirectory({
    required String videoPath,
    OnDownloadInProgress? downloading,
  });
}
