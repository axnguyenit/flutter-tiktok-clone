import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/blocs/mixins/mixins.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/global/global.dart';
import 'package:tiktok/widgets/widgets.dart';

part 'video_recording_icon.dart';

enum VideoRecordingStatus {
  init,
  recording,
  completed,
}

class VideoCreationCamera extends StatefulWidget {
  final CameraDescription mainCamera;
  final CameraDescription? frontCamera;

  const VideoCreationCamera({
    super.key,
    required this.mainCamera,
    this.frontCamera,
  });

  @override
  State<VideoCreationCamera> createState() => _VideoCreationCameraState();
}

class _VideoCreationCameraState extends State<VideoCreationCamera>
    with SessionData {
  late CameraController _controller;
  VideoRecordingStatus _videoRecordingStatus = VideoRecordingStatus.init;
  final _storageService = Provider().storageService;
  StreamSubscription? _subscription;
  File? _video;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.mainCamera,
      ResolutionPreset.veryHigh,
    );
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  Future<void> _startVideoRecording() async {
    await _controller.startVideoRecording();

    setState(() {
      _videoRecordingStatus = VideoRecordingStatus.recording;
    });

    final future = Future.delayed(
      const Duration(milliseconds: 3000),
    );
    _subscription = future.asStream().listen(
      (_) {
        if (_videoRecordingStatus == VideoRecordingStatus.init) {
          return;
        } else if (_videoRecordingStatus == VideoRecordingStatus.recording) {
          _stopVideoRecording();
        }
      },
    );
  }

  Future<void> _stopVideoRecording() async {
    try {
      await _subscription?.cancel();
      final xVideo = await _controller.stopVideoRecording();
      _video = File(xVideo.path);

      setState(() {
        _videoRecordingStatus = VideoRecordingStatus.completed;
      });

      if (currentUser?.uid != null) {
        final fileUrl = await _storageService.uploadVideo(
          currentUser!.uid,
          video: _video!,
          videoName: xVideo.name,
          uploading: (progress) {
            debugPrint('*********** $progress ***********');
          },
        );
      } else {
        log.warning('*********** UNAUTHENTICATED ***********');
      }
    } catch (e) {
      log.error('*********** VIDEO RECORDING ERROR >>>> $e ***********');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: context.darkColor,
          padding: const EdgeInsets.only(
            top: 36,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              XIconButton(
                icon: Icons.close_rounded,
                iconColor: context.lightColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                onPressed: () {
                  log.info('*********** Add Sound ***********');
                },
                child: XText.headlineSmall(
                  context.translate(
                    Strings.VideoCreation.addSound,
                  ),
                  style: context.headlineSmall?.copyWith(
                    color: context.lightColor,
                  ),
                ),
              ),
              XIconButton(
                icon: Icons.restart_alt_rounded,
                iconColor: context.lightColor,
                onPressed: () {
                  log.info('*********** SWITCH CAMERA ***********');
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              CameraPreview(_controller),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (_videoRecordingStatus ==
                          VideoRecordingStatus.completed) ...[
                        SizedBox(
                          width: 80,
                          child: GestureDetector(
                            child: Icon(
                              Icons.cancel_rounded,
                              size: 40,
                              color: context.lightColor,
                            ),
                            onTap: () {
                              setState(() {
                                _video = null;
                                _videoRecordingStatus =
                                    VideoRecordingStatus.init;
                              });
                            },
                          ),
                        ),
                      ],
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: GestureDetector(
                          onTap: () {
                            log.info('*********** RECORDING ***********');

                            if (_videoRecordingStatus ==
                                VideoRecordingStatus.init) {
                              _startVideoRecording();
                            } else if (_videoRecordingStatus ==
                                VideoRecordingStatus.recording) {
                              _stopVideoRecording();
                            }
                          },
                          child: VideoRecordingButton(
                            videoRecordingStatus: _videoRecordingStatus,
                          ),
                        ),
                      ),
                      if (_videoRecordingStatus ==
                          VideoRecordingStatus.completed) ...[
                        SizedBox(
                          width: 80,
                          child: GestureDetector(
                            child: Icon(
                              Icons.cloud_upload_rounded,
                              size: 44,
                              color: context.primaryColor,
                            ),
                            onTap: () {
                              // setState(() {
                              // _video = null;
                              //   _videoRecordingStatus = VideoRecordingStatus.init;
                              // });
                            },
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          color: context.darkColor,
        ),
      ],
    );
  }
}
