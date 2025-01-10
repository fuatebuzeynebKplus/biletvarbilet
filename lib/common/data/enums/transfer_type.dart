import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum TransferType {
  shuttle(0, 'Shuttle transfer'),
  vip(1, 'VIP transfer'),
  private(2, 'Private transfer'),
  shared(3, 'Shared transfer');

  final int value;
  final String description;

  const TransferType(this.value, this.description);

  String toString() => description;

  static TransferType fromString(String name) {
    switch (name) {
      case 'Shuttle transfer':
        return shuttle;
      case 'VIP transfer':
        return vip;
      case 'Private transfer':
        return private;
      case 'Shared transfer':
        return shared;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}