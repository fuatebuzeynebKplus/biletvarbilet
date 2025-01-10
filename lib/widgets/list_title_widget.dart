import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({
    super.key,
    required this.text,
    this.widget,
    required this.icon,
  });
  final String text;
  final Widget? widget;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: context.height * 0.05,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Row(children: [
            Icon(icon, color: AppColors.kSecondColor),
            const SizedBox(
              width: 8,
            ),
            TextWidget(
              text: text,
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ])),
    );
  }
}
