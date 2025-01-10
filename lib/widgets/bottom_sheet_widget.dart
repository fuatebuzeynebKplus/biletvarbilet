import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget(
      {super.key,
      required this.height,
      this.title,
      this.widgetBody,
      this.paddingLeftRight = 14,
      this.paddingTop = 14,
      this.circularRadius = 30,
      this.closeApply,
      this.heightBetweenBodyAndClose = 1.8,
      this.color = Colors.white,
      this.noScroll});
  final double height;
  final Widget? title;
  final Widget? widgetBody;
  final Widget? closeApply;
  final double? paddingTop;
  final double? paddingLeftRight;
  final double? circularRadius;
  final double? heightBetweenBodyAndClose;
  final Color? color;
  final bool? noScroll;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {
        //  Navigator.pop(context);
      },
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(circularRadius!),
                topRight: Radius.circular(circularRadius!)),
            color: color!,
          ),
          height: context.height * height,
          child: Padding(
            padding: EdgeInsets.only(
                top: paddingTop!,
                left: paddingLeftRight!,
                right: paddingLeftRight!),
            child: SingleChildScrollView(
              physics: noScroll == false
                  ? const NeverScrollableScrollPhysics()
                  : null,
              child: Column(
                children: [
                  title ?? const SizedBox(),
                  const SizedBox(
                    height: 12,
                  ),
                  widgetBody ?? const SizedBox(),
                  // closeApply == null
                  //     ? const SizedBox(
                  //         height: 0,
                  //       )
                  //     : SizedBox(
                  //         height: context.height *
                  //             (height - (height / heightBetweenBodyAndClose!)),
                  //       ),
                  closeApply ?? const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
