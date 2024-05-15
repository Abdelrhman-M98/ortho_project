// ignore_for_file: file_names, use_build_context_synchronously

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
    WidgetsBinding.instance.removeObserver(this);
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
    if (state == AppLifecycleState.resumed) {
      // When app is resumed, reinitialize the camera
      initializeCamera();
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
    } catch (e) {
      return;
    }
  }

  Future<void> checkMicrophonePermission() async {
    final microphoneStatus = await Permission.microphone.request();
    setState(() {
      isMicrophoneGranted = microphoneStatus.isGranted;
    });
  }

  void updateFlash() async {
    try {
      if (isFlashOn) {
        await cameraController?.setFlashMode(FlashMode.auto);
      } else {
        await cameraController?.setFlashMode(FlashMode.off);
      }
    } catch (e) {
      return;
    }
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
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (isCameraInitialized)
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
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
                Visibility(
                  visible: isCameraInitialized,
                  child: Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 300.w,
                          height: 390.h,
                          child: Image.asset(
                            'assets/images/photos/Vector.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
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
    } catch (e) {
      return;
    }
    setState(() {});
  }
}
