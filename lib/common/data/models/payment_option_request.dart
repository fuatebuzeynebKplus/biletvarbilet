import 'package:json_annotation/json_annotation.dart';

part 'payment_option_request.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class PaymentOptionRequest {
  List<String> resultKeys;
  String systemPnr;
  String tokenCode;

  PaymentOptionRequest({
    required this.resultKeys,
    required this.systemPnr,
    required this.tokenCode,
  });

  factory PaymentOptionRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOptionRequestToJson(this);
}

class PaymentOptionRequestJson {
  PaymentOptionRequest request;

  PaymentOptionRequestJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
