import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 12,
    this.fontWeight,
    this.textAlign = TextAlign.center,
    this.isHaveOverflow = false,
    this.fontFamily,
  });
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final bool isHaveOverflow;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          fontFamily: fontFamily),
      textAlign: textAlign!,
      overflow: isHaveOverflow == true ? TextOverflow.ellipsis : null,
    );
  }
}
