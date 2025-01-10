import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class TextSpacerWidgetWidget extends StatelessWidget {
  const TextSpacerWidgetWidget({
    super.key,
    required this.title,
    required this.widget,
    this.fontSize = 14,
    this.color = Colors.grey,
  });
  final String title;
  final Widget widget;
  final double? fontSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: title,
          fontSize: fontSize!,
          color: color!,
        ),
        const Spacer(),
        SizedBox(height: context.height * 0.036, child: widget)
      ],
    );
  }
}
