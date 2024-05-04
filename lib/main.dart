import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/screens/Camera_Page.dart';
import 'package:ortho/screens/OnBoard_Page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (_, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: OnBoarding(),
        ),
      ),
    );
  }
}
