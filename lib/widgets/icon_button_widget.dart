import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    this.onTap,
    this.buttonColor = Colors.white,
    required this.height,
    required this.width,
    this.widgetButton,
    required this.iconColor,
    this.icon,
    this.iconSize = 40,
    this.iconData,
    this.isIconNotImage = false,
    this.padding = 8.0,
    this.borderColor = Colors.transparent,
    this.crossAxisAlignment = false,
    this.mainAxisAlignment = false,
  });

  final Function()? onTap;
  final Color buttonColor;
  final double height;
  final double width;
  final Widget? widgetButton;
  final Color iconColor;
  final String? icon;
  final double? iconSize;
  final IconData? iconData;
  final bool? isIconNotImage;
  final double? padding;
  final Color? borderColor;
  final bool? crossAxisAlignment;
  final bool? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.height * height,
        width: context.width * width,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor!, width: 1),
            borderRadius: BorderRadius.circular(8),
            color: buttonColor),
        child: Padding(
          padding: EdgeInsets.all(padding!),
          child: Row(
            mainAxisAlignment: mainAxisAlignment == true
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            crossAxisAlignment: crossAxisAlignment == false
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: [
              isIconNotImage == true
                  ? Icon(
                      iconData,
                      size: iconSize,
                      color: iconColor,
                    )
                  : Image.asset(
                      icon ?? AppImages.calendarIcon,
                      height: iconSize,
                      width: iconSize,
                      color: iconColor,
                    ),
              // Icon(
              //   Icons.date_range,
              //   size: 35,
              //   color: iconColor,
              // ),
              SizedBox(
                width: widgetButton == null ? 0 : 8,
              ),
              widgetButton ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
