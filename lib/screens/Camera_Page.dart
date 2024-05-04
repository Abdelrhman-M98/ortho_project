// ignore_for_file: file_names, use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/components/CustomAppBar.dart';
import 'package:ortho/screens/Upload_Photo_Page.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController cameraController;
  late Future<void> cameraValue = Future.value(); // Provide a default value

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      cameraController = CameraController(
        cameras[0],
        ResolutionPreset.max,
      );
      cameraValue = cameraController.initialize();
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

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
          FutureBuilder<void>(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // Camera controller is initialized, show CameraPreview
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: CameraPreview(cameraController),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                // Camera controller is being initialized, show CircularProgressIndicator
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
                ;
              }
            },
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
                          onPressed: () {},
                          icon: Icon(
                            Icons.flash_off,
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
                          onPressed: () {},
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
}
