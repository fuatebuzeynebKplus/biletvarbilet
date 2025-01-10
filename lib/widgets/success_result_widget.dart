import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/widgets/alert_dialog_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ErrorResultWidget extends StatelessWidget {
  const ErrorResultWidget({
    super.key,
    this.subMessage,
    required this.message,
  });
  final String? subMessage;
  final String message;
  @override
  Widget build(BuildContext context) {
    return AlertDialogWidget(
      heightTest: 0.2,
      widthTest: 0.15,
      widget: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.doneIcon,
              height: 50,
              width: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: message,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            TextWidget(
              text: subMessage ?? '',
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      )),
    );
  }
}
