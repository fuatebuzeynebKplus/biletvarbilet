// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agent _$AgentFromJson(Map<String, dynamic> json) => Agent(
      agentId: (json['AgentId'] as num?)?.toInt(),
      agentType: (json['AgentType'] as num?)?.toInt(),
      company: json['Company'] == null
          ? null
          : Company.fromJson(json['Company'] as Map<String, dynamic>),
      currentAccount: json['CurrentAccount'] == null
          ? null
          : CurrentAccount.fromJson(
              json['CurrentAccount'] as Map<String, dynamic>),
      discountCodes: json['DiscountCodes'] as List<dynamic>?,
      gSAInfo: json['GSAInfo'],
      iATAType: (json['IATAType'] as num?)?.toInt(),
      logo: json['Logo'] as String?,
      user: json['User'] == null
          ? null
          : User.fromJson(json['User'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AgentToJson(Agent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AgentId', instance.agentId);
  writeNotNull('AgentType', instance.agentType);
  writeNotNull('Company', instance.company?.toJson());
  writeNotNull('CurrentAccount', instance.currentAccount?.toJson());
  writeNotNull('DiscountCodes', instance.discountCodes);
  writeNotNull('GSAInfo', instance.gSAInfo);
  writeNotNull('IATAType', instance.iATAType);
  writeNotNull('Logo', instance.logo);
  writeNotNull('User', instance.user?.toJson());
  return val;
}
