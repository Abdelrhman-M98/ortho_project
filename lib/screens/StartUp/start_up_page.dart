// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/screens/Home/Home_Page.dart';
import 'package:ortho/screens/Login/Login_page.dart';
import 'package:ortho/screens/StartUp/startUpNotifier.dart';

class StartUpPage extends HookConsumerWidget {
  const StartUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StartUpProviderNotifier = ref.watch(StartUpProvider.notifier);
    final StartUpProviderState = ref.watch(StartUpProvider);

    final isTriggred = useState(false);
    Future(() {
      if (isTriggred.value) return null;
      StartUpProviderNotifier.startUp();
      isTriggred.value = true;
    });
    ref.listen(StartUpProvider, (previous, next) {
      if (next.isLoading) {
        return;
      }
      if (next.authState == AuthState.authenticated) {
        Route route = MaterialPageRoute(
          builder: (context) => HomePage(),
        );
        Navigator.pushReplacement(context, route);
        return;
      }
      if (next.authState == AuthState.failed) {
        Route route = MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
        Navigator.pushReplacement(context, route);

        return;
      }
    });

    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(
        color: AppColors.Primary_color,
      ),
    ));
  }
}
