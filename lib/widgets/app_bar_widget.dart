import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key,
      this.leading,
      this.action,
      this.onPressedLeading,
      this.onPressedAction,
      this.title,
      this.isImage = false});
  final IconData? leading;
  final IconData? action;
  final Function()? onPressedLeading;
  final Function()? onPressedAction;
  final String? title;
  final bool isImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: title != null ? 20 : 25,
              onPressed: onPressedLeading,
              color: title != null ? Colors.white : Colors.white,
              icon: Icon(leading),
            ),
            title != null
                ? TextWidget(
                    text: title!,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                : Image.asset(
                    AppImages.logo,
                    height: context.height * 0.07,
                    width: context.height * 0.25,
                  ),
            isImage == false
                ? IconButton(
                    iconSize: 30,
                    onPressed: onPressedAction,
                    color: Colors.white,
                    icon: Icon(action),
                  )
                : GestureDetector(
                    onTap: onPressedAction,
                    child: Image.asset(
                      'assets/icons/view_icon.png',
                      height: 24,
                      width: 24,
                      color: Colors.white,
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
