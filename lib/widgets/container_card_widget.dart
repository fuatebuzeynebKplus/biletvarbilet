import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerCardWidget extends StatelessWidget {
  const ContainerCardWidget({
    super.key,
    required this.text,
    this.leading,
    this.action,
    this.height = 0.07,
    this.isShadow = false,
    this.onTap,
    this.onTapForActionButton,
    this.widgetBody,
    this.fontSize = 16,
    this.paddingTop = 12,
    this.paddingLeftRight = 16,
    this.borderColor,
    this.haveAColumText = false,
    this.columText,
    this.width = 1,
  });
  final String text;
  final Widget? leading;
  final Widget? action;
  final bool? isShadow;
  final double? height;
  final double? width;
  final Function()? onTap;
  final Function()? onTapForActionButton;
  final Widget? widgetBody;
  final double? fontSize;
  final double? paddingTop;
  final double? paddingLeftRight;
  final Color? borderColor;
  final bool haveAColumText;
  final String? columText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: isShadow == false ? Colors.transparent : Colors.black45,
              offset: const Offset(0.0, 1.0), //(x,y)
              blurRadius: isShadow == false ? 0 : 1.5,
            ),
          ],
        ),
        padding: EdgeInsets.only(
            left: paddingLeftRight!,
            right: paddingLeftRight!,
            top: paddingTop!),
        height: context.height * height!,
        width: context.width * width!,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leading ?? const SizedBox(),
                leading != null
                    ? const SizedBox(
                        width: 8,
                      )
                    : const SizedBox(),
                haveAColumText == true
                    ? const SizedBox()
                    : TextWidget(
                        text: text,
                        color: Colors.black45,
                        fontSize: fontSize!,
                        fontWeight: FontWeight.bold,
                        isHaveOverflow: true,
                      ),
                haveAColumText == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: text,
                            color: Colors.black,
                            fontSize: fontSize!,
                            fontWeight: FontWeight.bold,
                            isHaveOverflow: true,
                          ),
                          TextWidget(
                            text: columText!,
                            color: Colors.black45,
                            fontSize: 12,
                            // fontWeight: FontWeight.bold,
                          ),
                        ],
                      )
                    : const SizedBox(),
                const Spacer(),
                GestureDetector(
                    onTap: onTapForActionButton,
                    child: action ?? const SizedBox()),
              ],
            ),
            widgetBody ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
