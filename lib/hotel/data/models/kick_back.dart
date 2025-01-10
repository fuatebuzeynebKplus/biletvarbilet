import 'package:json_annotation/json_annotation.dart';

part 'kick_back.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class KickBack {
  int? id;
  double? amount;
  String? currencyCode;

  KickBack({this.amount, this.currencyCode, this.id});

  factory KickBack.fromJson(Map<String, dynamic> json) =>
      _$KickBackFromJson(json);

  Map<String, dynamic> toJson() => _$KickBackToJson(this);
}

class KickBackJson {
  KickBack request;

  KickBackJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
