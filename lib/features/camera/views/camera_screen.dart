// import 'dart:developer';

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:threads/features/settings/view_models/settings_vm.dart';
import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class CameraScreen extends ConsumerStatefulWidget {
  const CameraScreen({super.key});

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen> {
  bool _hasPermission = false;
  late final bool _noCamera = kDebugMode && Platform.isIOS; // Simulator

  late CameraController _cameraController;

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) return;

    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
    );

    await _cameraController.initialize();
    await _cameraController.takePicture();

    if (!mounted) return;
    setState(() {});
  }

  Future<void> _takePicture() async {
    // if (_cameraController.value.isRecordingVideo) return;
    final file = await _cameraController.takePicture();

    if (!mounted) return;

    Navigator.of(context).pop(file.path);
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    if (!cameraDenied) {
      _hasPermission = true;
      if (!_noCamera) {
        await initCamera();
      }
      setState(() {});
    }
  }

  Future<void> _onPickImagePressed() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage == null) return;

    if (!mounted) return;

    Navigator.of(context).pop(pickedImage.path);
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
  }

  @override
  void dispose() {
    if (!_noCamera) _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(settingsProvider).darkMode;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : Colors.white,
      ),
      body: SizedBox(
        child: !_hasPermission
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Initializing...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size20,
                    ),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive(),
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  if (!_noCamera) CameraPreview(_cameraController),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: Sizes.size40,
                    child: Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: _takePicture,
                          child: Container(
                            width: Sizes.size72,
                            height: Sizes.size72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: _onPickImagePressed,
                              icon: FaIcon(
                                FontAwesomeIcons.image,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
