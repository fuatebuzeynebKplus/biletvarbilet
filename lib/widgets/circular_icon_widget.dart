import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CircularIconWidget extends StatelessWidget {
  const CircularIconWidget({
    super.key,
    required this.iconColor,
    required this.borderColor,
    this.icon,
    this.circularColor,
    this.size = 0.045,
    this.borderRadius = 24,
    this.title,
  });
  final Color iconColor;
  final Color borderColor;
  final Color? circularColor;
  final IconData? icon;
  final double? size;
  final double? borderRadius;
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * size!,
      width: context.height * size!,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius!),
        color: circularColor,
      ),
      child: Center(
        child: icon == null
            ? title
            : Icon(
                icon,
                color: iconColor,
                size: size! * 550,
              ),
      ),
    );
  }
}
