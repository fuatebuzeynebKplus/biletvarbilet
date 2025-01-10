import 'package:json_annotation/json_annotation.dart';

part 'channel_credential.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ChannelCredential {
  String channelCode;
  String channelPassword;
  String? clientIdentifier;
  String? userIpAddress;

  ChannelCredential({
    required this.channelCode,
    required this.channelPassword,
    this.clientIdentifier,
    this.userIpAddress,
  });

  factory ChannelCredential.fromJson(Map<String, dynamic> json) =>
      _$ChannelCredentialFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelCredentialToJson(this);
}
