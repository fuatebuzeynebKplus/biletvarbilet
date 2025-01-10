import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class IconAndTwoTextForFlightDetailsBottomSheetWidget extends StatelessWidget {
  const IconAndTwoTextForFlightDetailsBottomSheetWidget({
    super.key,
    required this.image,
    required this.date,
    required this.day,
  });
  final String image;
  final String date;
  final String day;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.width * 0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: context.height * 0.042,
            width: context.height * 0.042,
            color: Colors.grey.shade700,
          ),
          const SizedBox(
            width: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: date,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              TextWidget(
                text: day,
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
