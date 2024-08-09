import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/core/core_component/loading_component.dart';
import 'package:big_bite/core/extensions/ui_extensions/app_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  AppButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.height,
      this.width,
      this.margin,
      this.isLoading,
      this.color,
      this.style});

  final String label;
  final VoidCallback onTap;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final TextStyle? style;
  final Color? color;
  bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 14.w,
        margin: margin,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: isLoading == true
            ? const LoadingComponent()
            : Text(
                label,
                style: style,
              ),
      ),
    );
  }
}
