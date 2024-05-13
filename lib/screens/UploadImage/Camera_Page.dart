// ignore_for_file: file_names, use_build_context_synchronously, empty_catches

import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_editor/image_editor.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/screens/UploadImage/Upload_Photo_Page.dart';
import 'package:permission_handler/permission_handler.dart';

late List<CameraDescription> cameras;
int currentCameraIndex = 0;
bool isFrontCamera = false;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

bool isCameraInitialized = false;
bool isMicrophoneGranted = false;
bool isFlashOn = false;
late CameraController? cameraController;

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initializeCamera();
  }

  @override
  void dispose() {
    // Turn off flash before disposing the camera controller
    if (mounted) {
      cameraController?.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      cameraController?.dispose();
    }
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      cameraController = CameraController(
        cameras[currentCameraIndex],
        ResolutionPreset.max,
      );
      await cameraController!.initialize();
      setState(() {
        isCameraInitialized = true;
      });

      // Check microphone permission after camera is initialized
      await checkMicrophonePermission();
    } catch (e) {}
  }

  Future<void> checkMicrophonePermission() async {
    final microphoneStatus = await Permission.microphone.request();
    setState(() {
      isMicrophoneGranted = microphoneStatus.isGranted;
    });
  }

  Future<void> checkPermission(
      Permission permission, BuildContext context) async {
    final status = await permission.request();

    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Permission is Granted"),
        ),
      );

      if (permission == Permission.camera) {
        // Check microphone permission if camera permission is granted
        await checkMicrophonePermission();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Permission is not Granted"),
        ),
      );
    }
  }

  void updateFlash() async {
    try {
      if (isFlashOn) {
        await cameraController?.setFlashMode(FlashMode.auto);
      } else {
        await cameraController?.setFlashMode(FlashMode.off);
      }
    } catch (e) {}
  }

  late Future<void> cameraValue = Future.value(); // Provide a default value
  bool isCameraInitialized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(181, 0, 0, 0),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            size: 30,
            Icons.close,
            color: AppColors.White,
          ),
        ),
      ),
      body: Stack(
        children: [
          if (isCameraInitialized)
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: CameraPreview(cameraController!),
            )
          else
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.Primary_color,
                ),
              ),
            ),
          isCameraInitialized
              ? Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    child: Image.asset(
                      'assets/images/photos/Vector.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : const SizedBox(
                  width: 0,
                  height: 0,
                ),
          Positioned(
            bottom: 0.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                alignment: Alignment.bottomCenter,
                color: const Color.fromARGB(181, 0, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFlashOn = !isFlashOn;
                            });
                            updateFlash();
                          },
                          icon: Icon(
                            isFlashOn ? Icons.flash_on : Icons.flash_off,
                            color: AppColors.White,
                            size: 30.sp,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            takePic(context);
                          },
                          icon: Icon(
                            Icons.panorama_fish_eye,
                            color: AppColors.White,
                            size: 60.sp,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            switchCamera();
                          },
                          icon: Icon(
                            Icons.flip_camera_android_outlined,
                            color: AppColors.White,
                            size: 30.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void takePic(BuildContext context) async {
    final imageFile = await cameraController!.takePicture();
    var file = File(imageFile.path);
    if (cameras[currentCameraIndex].lensDirection ==
        CameraLensDirection.front) {
      Uint8List? imageBytes = await file.readAsBytes();

      if (cameras[currentCameraIndex].lensDirection ==
          CameraLensDirection.front) {
        final ImageEditorOption option = ImageEditorOption();
        option.addOption(
          const FlipOption(horizontal: true),
        );
        imageBytes = await ImageEditor.editImage(
            image: imageBytes, imageEditorOption: option);
      } else {
        final ImageEditorOption option = ImageEditorOption();
        option.addOption(
          const FlipOption(horizontal: false),
        );
        imageBytes = await ImageEditor.editImage(
            image: imageBytes, imageEditorOption: option);
      }

      // 3. write the image back to disk
      await file.delete();
      await file.writeAsBytes(imageBytes!);
    }
    cameraController?.setFlashMode(FlashMode.off);
    Route route = MaterialPageRoute(
      builder: (context) => UploadPage(
        imagepath: file.path,
      ),
    );
    Navigator.pushReplacement(context, route);
  }

  void switchCamera() async {
    currentCameraIndex = (currentCameraIndex + 1) % cameras.length;
    try {
      await cameraController?.dispose();
      cameraController = CameraController(
        cameras[currentCameraIndex],
        ResolutionPreset.max,
      );
      await cameraController!.initialize();
    } catch (e) {}
    setState(() {});
  }
}
