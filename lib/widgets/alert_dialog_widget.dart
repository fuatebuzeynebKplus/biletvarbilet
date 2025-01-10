import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    Key? key,
    required this.widget,
    this.isHaveBorder = false,
    this.heightTest = 0.25,
    this.widthTest = 0.25,
    this.color = Colors.white,
  }) : super(key: key);

  final Widget widget;
  final bool? isHaveBorder;
  final double? heightTest;
  final double? widthTest;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isHaveBorder! ? AppColors.kSecondColor : Colors.transparent,
          width: isHaveBorder! ? 1.0 : 0.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      backgroundColor: color,
      content: SizedBox(
        height: context.height * heightTest!,
        width: context.width * widthTest!,
        child: widget,
      ),
    );
  }
}
