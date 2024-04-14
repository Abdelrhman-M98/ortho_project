// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ortho/components/AppColors.dart';

class BtnWidget extends StatelessWidget {
  final String btnText;
  final Function()? onTap;

  const BtnWidget({super.key, required this.btnText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 60,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.btn_background,
        ),
        child: Text(
          btnText,
          style: const TextStyle(
            color: AppColors.White_text,
            fontFamily: "Nunito",
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
