import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ortho/components/AppColors.dart';

class InputFeild extends HookWidget {
  InputFeild({
    super.key,
    required this.titel,
    required this.controller,
    required this.validator,
  });

  final String titel;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final inputFocusNode = useMemoized(() => FocusNode());

  @override
  Widget build(BuildContext context) {
    final isFocused = useState(false);
    final isValid = useState(true);

    inputFocusNode.addListener(() {
      isFocused.value = inputFocusNode.hasFocus;
    });

    return TextFormField(
      controller: controller,
      focusNode: inputFocusNode,
      autofocus: false,
      obscureText: false,
      decoration: InputDecoration(
        labelText: titel,
        labelStyle: TextStyle(
          color: isFocused.value
              ? isValid.value
                  ? AppColors.Primary_color
                  : AppColors.Fail_Text
              : AppColors.FormNonFouceColor,
          fontFamily: 'Nunito',
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.FormNonFouceColor,
            width: 0.8.w,
          ),
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(36),
            right: Radius.circular(36),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.Primary_color,
            width: 1.1.w,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(36),
            topLeft: Radius.circular(8),
            topRight: Radius.circular(36),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.Pin_error_color,
            width: 2,
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(36),
            right: Radius.circular(36),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.Pin_error_color,
            width: 2,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(80),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(80),
          ),
        ),
        suffixIcon: controller.text.isNotEmpty
            ? isValid.value
                ? Image.asset(
                    "assets/images/icons/vailedName.png",
                    width: 16.w,
                    height: 16.h,
                  )
                : Image.asset(
                    "assets/images/icons/NotVailedName.png",
                    width: 16.w,
                    height: 16.h,
                  )
            : null,
      ),
      style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
      onTap: () {
        isFocused.value = true;
      },
      validator: (value) {
        isValid.value = validator(value) == null;
        return validator(value);
      },
    );
  }
}
