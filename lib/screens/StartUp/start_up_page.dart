// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ortho/components/AppColors.dart';
import 'package:ortho/screens/Login/Login_page.dart';
import 'package:ortho/screens/StartUp/startUpNotifier.dart';
import 'package:ortho/screens/UserHomePage/User_Home_Page.dart';

class StartUpPage extends HookConsumerWidget {
  const StartUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StartUpProviderNotifier = ref.watch(StartUpProvider.notifier);
    final StartUpProviderState = ref.watch(StartUpProvider);
    ref.listen(StartUpProvider, (previous, next) {
      if (next.isLoading) {
        return;
      }
      if (next.authState == AuthState.authenticated) {
        Route route = MaterialPageRoute(
          builder: (context) => const UserHomePage(),
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
