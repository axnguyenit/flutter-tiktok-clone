import 'dart:async';
import 'dart:io';

import 'package:common/common.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tiktok/services/services.dart';
import 'package:tiktok/utils/file.dart';

class StorageServiceImpl implements StorageService {
  StorageServiceImpl();

  @override
  Future<String?> uploadVideo(
    String userId, {
    required File video,
    required String videoName,
    OnUploadInProgress? uploading,
    StorageController? controller,
  }) async {
    final storageRef = FirebaseStorage.instance.ref(userId);
    final fileRef = storageRef.child(videoName);
    log
      ..info('VIDEO UPLOAD INFO: ', messages: [
        '- USER ID >>>> $userId',
        '- FILE >>>> ${fileRef.fullPath}',
        '- LENGTH >> ${video.lengthSync()}'
      ])
      ..info('FILE EXISTED >> ${video.existsSync()}');
    final uploadTask = fileRef.putFile(
      video,
      SettableMetadata(
        contentType: 'video/mp4',
      ),
    );

    try {
      final completer = Completer<String?>();
      bool isCanceled = false;
      if (controller != null) {
        controller.onUploadingCanceled = () async {
          return isCanceled = await uploadTask.cancel();
        };
      }
      uploadTask.snapshotEvents.listen((taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            final progress = 100.0 *
                (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            log.info('Upload is $progress% complete.');
            if (uploading != null) {
              uploading(progress);
            }
            break;
          case TaskState.paused:
            log.info('Upload Video Paused');
            break;
          case TaskState.success:
            if (isCanceled) {
              completer.complete(null);
            } else {
              completer.complete(fileRef.fullPath);
            }
            break;
          case TaskState.canceled:
            log.info('Upload Video Canceled');
            completer.complete(null);
            break;
          case TaskState.error:
            log.info(
                '''Upload Video Error >> ${taskSnapshot.bytesTransferred.bitLength}''');
            break;
        }
      });
      return completer.future;
    } on FirebaseException catch (e) {
      log.error('Firebase Exception Error >> $e');
    } catch (e) {
      log.error('Upload File Error >> $e');
    }
    return null;
  }

  @override
  Future<String?> downloadAndSaveVideoToTempDirectory({
    required String videoPath,
    OnDownloadInProgress? downloading,
  }) async {
    final path = videoPath.startsWith('/') ? videoPath : '/$videoPath';
    final fileRef = FirebaseStorage.instance.ref(path);

    try {
      final tempPath = await FileExtension.getTempDirectory();
      final fileName = videoPath.split('/').last;
      final filePath = '$tempPath/$fileName';
      final file = File(filePath);

      final completer = Completer<String>();
      final downloadTask = fileRef.writeToFile(file);
      downloadTask.snapshotEvents.listen((taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            final progress = 100.0 *
                (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            log.info('Upload is $progress% complete.');
            if (downloading != null) {
              downloading(progress);
            }
            break;
          case TaskState.paused:
            break;
          case TaskState.success:
            completer.complete(fileName);
            break;
          case TaskState.canceled:
            break;
          case TaskState.error:
            break;
        }
      });
      return completer.future;
    } catch (e) {
      log.error('Download Video File Error >> $e >> PATH >> $path');
    }
    return null;
  }
}
