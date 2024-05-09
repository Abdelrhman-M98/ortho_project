import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/screens/OnBoard/OnBoard_Page.dart';
import 'package:ortho/screens/StartUp/start_up_page.dart';
import 'package:ortho/screens/UploadImage/Camera_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('firstTime') ?? true;

  runApp(ProviderScope(
    child: MyApp(isFirstTime: isFirstTime),
  ));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isFirstTime ? const OnBoarding() : const StartUpPage(),
      ),
    );
  }
}
