// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ortho/components/AppColors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.titleText,
      required this.onTap,
      required this.barIcon});

  final String titleText;
  final Function()? onTap;
  final Icon barIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: barIcon,
        onPressed: () {
          onTap?.call();
        },
      ),
      title: Text(
        titleText,
        style: const TextStyle(
          color: AppColors.btn_background,
          fontFamily: "Nunito",
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
