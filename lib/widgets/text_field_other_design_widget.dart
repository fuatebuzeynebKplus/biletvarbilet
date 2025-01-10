import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldOtherDesignWidget extends StatelessWidget {
  const TextFieldOtherDesignWidget(
      {super.key,
      this.height = 0.048,
      required this.text,
      this.icon,
      this.padding = 4,
      this.circularLeftTopAndBottom = 15,
      this.onChanged,
      this.textInputType,
      this.width = 0.43,
      this.maxLength,
      this.inputFormatters,
      this.initialValue,
      this.controller,
      this.circularRightTopAndBottom = 15,
      this.autofocus = false});
  final double? height;
  final String text;
  final IconData? icon;
  final double? padding;
  final double? circularLeftTopAndBottom;
  final double? circularRightTopAndBottom;
  final Function(String)? onChanged;
  final TextInputType? textInputType;
  final double? width;
  final int? maxLength;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        // FlightTicketCubit flightTicketCubit =
        //     BlocProvider.of<FlightTicketCubit>(context);
        return SizedBox(
          height: context.height * height!,
          width: context.width * width!,
          child: TextFormField(
            controller: controller,
            autofocus: autofocus,
            initialValue: initialValue,
            textAlignVertical: TextAlignVertical.bottom,
            textInputAction: TextInputAction.next,
            keyboardType: textInputType,
            onChanged: onChanged,
            style: const TextStyle(color: Colors.black87, fontSize: 14),
            cursorColor: AppColors.kSecondColor,
            decoration: InputDecoration(
              suffixIcon: Icon(icon),
              hintText: text,
              hintStyle: TextStyle(
                color: Colors.grey.shade600,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(circularRightTopAndBottom!),
                  bottomLeft: Radius.circular(circularRightTopAndBottom!),
                  topRight: Radius.circular(circularLeftTopAndBottom!),
                  bottomRight: Radius.circular(circularLeftTopAndBottom!),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(circularRightTopAndBottom!),
                  bottomLeft: Radius.circular(circularRightTopAndBottom!),
                  topRight: Radius.circular(circularLeftTopAndBottom!),
                  bottomRight: Radius.circular(circularLeftTopAndBottom!),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(circularRightTopAndBottom!),
                  bottomLeft: Radius.circular(circularRightTopAndBottom!),
                  topRight: Radius.circular(circularLeftTopAndBottom!),
                  bottomRight: Radius.circular(circularLeftTopAndBottom!),
                ),
              ),
            ),
            maxLength: maxLength,
            inputFormatters: inputFormatters,
          ),
        );
      },
    );
  }
}
