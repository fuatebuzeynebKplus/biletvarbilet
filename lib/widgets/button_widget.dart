import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_sizes.dart';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    this.onTap,
    this.color = Colors.white,
    required this.height,
    required this.width,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
    required this.textColor,
    this.border,
    this.borderCircularValue = 8,
    this.theTextISLeft = false,
    this.horizontalPadding = 12,
  });
  final String title;
  final Function()? onTap;
  final Color color;
  final double height;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final BoxBorder? border;
  final double borderCircularValue;
  final bool? theTextISLeft;
  final double? horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: context.height * height,
          width: context.width * width,
          decoration: BoxDecoration(
              border: border,
              borderRadius: BorderRadius.circular(borderCircularValue),
              color: color),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding!),
            child: Row(
              mainAxisAlignment: theTextISLeft == true
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: title,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: textColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
