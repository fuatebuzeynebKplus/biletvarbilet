import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_sizes.dart';

import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
    this.image,
    this.color = Colors.white,
  });
  final String title;
  final Function()? onTap;
  final IconData? icon;
  final String? image;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.height * 0.08, //23
        width: context.width * 1, //45
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 1.5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon == null
                  ? Image.asset(
                      image ?? AppImages.logo,
                      height: 130,
                      width: 180,
                    )
                  : Icon(
                      icon,
                      size: 35,
                      color: Colors.black54,
                    ),
              const SizedBox(
                width: 10,
              ),
              TextWidget(
                text: title,
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
