import 'package:bamobile1/common/data/enums/hotpoint_type.dart';
import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_search_leg.dart';
import 'package:bamobile1/flight/data/models/hotpoint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MultiPointModel {
  String departureCode;
  String departureCityName;
  String arrivalCode;
  String arrivalCityName;
  double turns = 0;
  DateTime? departureDate;

  MultiPointModel({
    required this.departureCode,
    required this.arrivalCode,
    required this.departureDate,
    required this.departureCityName,
    required this.arrivalCityName,
  });
}

// تعريف AirSearchLeg و Hotpoint

// دالة تحويل القائمة

List<AirSearchLeg>? convertMultiPointToAirSearchLeg(
    List<MultiPointModel> multiPointList, BuildContext context) {
  return multiPointList.map((multiPoint) {
    return AirSearchLeg(
        departurePoint: Hotpoint(
          cityCode: multiPoint.departureCityName ?? 'Unknown Departure City',
          code: multiPoint.departureCode ?? 'Unknown Departure Code',
          hotpointType: HotpointType.airport,
        ),
        arrivalPoint: Hotpoint(
          cityCode: multiPoint.arrivalCityName ?? 'Unknown Arrival City',
          code: multiPoint.arrivalCode ?? 'Unknown Arrival Code',
          hotpointType: HotpointType.airport,
        ),
        date: BlocProvider.of<FlightTicketCubit>(context)
            .convertArabicNumbersToEnglish(DateFormat('dd.MM.yyyy').format(
                    multiPoint.departureDate!) // يبقي كما هو إذا كانت null
                ));
  }).toList();
}
