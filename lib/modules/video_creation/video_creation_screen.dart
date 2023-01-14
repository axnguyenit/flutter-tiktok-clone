import 'package:camera/camera.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'video_creation_camera.dart';

class VideoCreationScreen extends StatefulWidget {
  const VideoCreationScreen({super.key});

  @override
  State<VideoCreationScreen> createState() => _VideoCreationScreenState();
}

class _VideoCreationScreenState extends State<VideoCreationScreen> {
  late CameraDescription _camera;
  late CameraDescription? _frontCamera;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setUpCamera();
    });
  }

  Future<void> _setUpCamera() async {
    final cameras = await availableCameras();

    _camera = cameras.first;
    _frontCamera = cameras.firstWhereOrNull(
      (camera) => camera.lensDirection == CameraLensDirection.front,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _setUpCamera(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Press button to start');
            case ConnectionState.waiting:
              return const Text('Awaiting result...');
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return VideoCreationCamera(mainCamera: _camera);
              }
          }
        },
      ),
    );
  }
}
