import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_fare_service.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetForFlightDetailsWidget extends StatelessWidget {
  const BottomSheetForFlightDetailsWidget({
    super.key,
    this.title,
    this.widgetBody,
    this.paddingLeftRight = 14,
    this.paddingTop = 14,
    this.circularRadius = 30,
  });

  final Widget? title;
  final Widget? widgetBody;

  final double? paddingTop;
  final double? paddingLeftRight;
  final double? circularRadius;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      onClosing: () {
        //  Navigator.pop(context);
      },
      builder: (BuildContext context) {
        return Column(
          children: [
            Container(
              height: context.height * 0.05,
              width: context.width * 1,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(30),
                    // topRight: Radius.circular(30),
                    ),
                color: Colors.white,
              ),
              //height: (size.height * height) / 6,
              child: Padding(
                padding: EdgeInsets.only(
                    top: paddingTop!,
                    left: paddingLeftRight!,
                    right: paddingLeftRight!),
                child: title ?? const SizedBox(),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: paddingTop!,
                      left: paddingLeftRight!,
                      right: paddingLeftRight!),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        widgetBody ?? const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
