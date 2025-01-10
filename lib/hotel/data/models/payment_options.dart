import 'package:json_annotation/json_annotation.dart';

part 'payment_options.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class PaymentOptions {
  String tokenCode;
  List<String> ResultKeys;

  PaymentOptions({
    required this.tokenCode,
    required this.ResultKeys,
  });

  factory PaymentOptions.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOptionsToJson(this);
}

class PaymentOptionsJson {
  PaymentOptions request;

  PaymentOptionsJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
