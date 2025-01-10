import 'package:bamobile1/widgets/text_widget.dart';

import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerInsideIconAndTextForFlightDetailsBottomSheetWidget
    extends StatelessWidget {
  const ContainerInsideIconAndTextForFlightDetailsBottomSheetWidget({
    super.key,
    this.title,
  });

  final String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        title == null
            ? const SizedBox()
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                //    height: 35,
                //width: context.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  color: Colors.grey.shade100,
                ),
                child: TextWidget(
                  textAlign: TextAlign.start,
                  isHaveOverflow: true,
                  text: title!,
                  color: Colors.grey.shade700,
                ),
              ),
      ],
    );
  }
}
