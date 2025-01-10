import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TwoStopDesignWidget extends StatelessWidget {
  const TwoStopDesignWidget({
    super.key,
    this.dividerWidth = 0.14,
    this.text = true,
  });
  final double? dividerWidth;
  final bool? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade600,
                  border: Border.all(color: Colors.grey.shade400, width: 2)),
            ),
            SizedBox(
              width: context.width * dividerWidth!,
              child: const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 5,
                // عرض الفاصل (المسافة بين العناصر)
              ),
            ),
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade600, width: 1),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade600, width: 1),
              ),
            ),
            SizedBox(
              width: context.width * dividerWidth!,
              child: const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 5,
                // عرض الفاصل (المسافة بين العناصر)
              ),
            ),
            Icon(
              Icons.location_on,
              size: 16,
              color: AppColors.kSecondColor,
            ),
          ],
        ),
        text == false
            ? const SizedBox()
            : TextWidget(
                text: '2-${S.of(context).Stop}',
                color: Colors.red,
                fontSize: 12,
              ),
      ],
    );
  }
}
