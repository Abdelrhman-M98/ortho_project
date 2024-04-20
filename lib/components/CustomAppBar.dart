// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:ortho/components/AppColors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {required this.titleText, required this.onTap, required this.barIcon});

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
      title: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          titleText,
          style: const TextStyle(
            color: AppColors.Primary_color,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
