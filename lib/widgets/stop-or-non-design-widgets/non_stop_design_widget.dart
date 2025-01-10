import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NonStopDesignWidget extends StatelessWidget {
  const NonStopDesignWidget({
    super.key,
    this.dividerWidth = 0.18,
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
              ),
            ),
            getIt<CacheHelper>().getDataString(key: 'Lang') != 'ar'
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Image.asset(
                      'assets/icons/flight_icon_right.png',
                      height: context.height * 0.025,
                      width: context.height * 0.025,
                      color: Colors.grey,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Transform.rotate(
                      angle: 3.14159, // 180 degrees in radians
                      child: Image.asset(
                        'assets/icons/flight_icon_right.png',
                        height: context.height * 0.025,
                        width: context.height * 0.025,
                        color: Colors.grey,
                      ),
                    ),
                  ),
            SizedBox(
              width: context.width * dividerWidth!,
              child: const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 5,
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
                text: S.of(context).NonStop,
                color: Colors.red,
                fontSize: 12,
              ),
      ],
    );
  }
}
