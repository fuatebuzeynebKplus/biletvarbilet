// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fare_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FareData _$FareDataFromJson(Map<String, dynamic> json) => FareData(
      agentPerCalculationTypes: json['AgentPerCalculationTypes'],
      applyAllSegments: json['ApplyAllSegments'] as bool?,
      cFlightScheduleId: json['CFlightScheduleId'],
      combinations: json['Combinations'],
      flightProviderId: json['FlightProviderId'],
      hasSplitTicket: json['HasSplitTicket'] as bool?,
      perCalculationType: json['PerCalculationType'],
      providerHasSplitTicket: json['ProviderHasSplitTicket'] as bool?,
      providerId: json['ProviderId'],
      providerType: json['ProviderType'],
    );

Map<String, dynamic> _$FareDataToJson(FareData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AgentPerCalculationTypes', instance.agentPerCalculationTypes);
  writeNotNull('ApplyAllSegments', instance.applyAllSegments);
  writeNotNull('CFlightScheduleId', instance.cFlightScheduleId);
  writeNotNull('Combinations', instance.combinations);
  writeNotNull('FlightProviderId', instance.flightProviderId);
  writeNotNull('HasSplitTicket', instance.hasSplitTicket);
  writeNotNull('PerCalculationType', instance.perCalculationType);
  writeNotNull('ProviderHasSplitTicket', instance.providerHasSplitTicket);
  writeNotNull('ProviderId', instance.providerId);
  writeNotNull('ProviderType', instance.providerType);
  return val;
}
