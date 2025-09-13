import 'package:flutter/material.dart';
import 'package:pizza_mizza_saas/utils/constants/app_paddings.dart';
import 'package:pizza_mizza_saas/utils/constants/app_radiuses.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = AppRadiuses.zero,
    required this.text,
  });

  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadiusGeometry borderRadius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: AppPaddings.h1,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
