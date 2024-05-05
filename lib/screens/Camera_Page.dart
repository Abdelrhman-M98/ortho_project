// ignore_for_file: file_names, use_build_context_synchronously, empty_catches

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/screens/Upload_Photo_Page.dart';
import 'package:permission_handler/permission_handler.dart';

late List<CameraDescription> cameras;
int currentCameraIndex = 0;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

bool isCameraInitialized = false;
bool isMicrophoneGranted = false;
bool isFlashOn = false;
late CameraController cameraController;

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      cameraController = CameraController(
        cameras[currentCameraIndex],
        ResolutionPreset.max,
      );
      await cameraController.initialize();
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
        await cameraController.setFlashMode(FlashMode.torch);
      } else {
        await cameraController.setFlashMode(FlashMode.off);
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
              child: CameraPreview(cameraController),
            )
          else
            const Center(
              child: CircularProgressIndicator(),
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
                    padding: const EdgeInsets.only(bottom: 60.0),
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
    final image = await cameraController.takePicture();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UploadPage(
          imagepath: image.path,
        ),
      ),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void switchCamera() async {
    currentCameraIndex = (currentCameraIndex + 1) % cameras.length;
    try {
      await cameraController.dispose();
      cameraController = CameraController(
        cameras[currentCameraIndex],
        ResolutionPreset.max,
      );
      await cameraController.initialize();
    } catch (e) {}
    setState(() {});
  }
}
