import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum PaymentCommissionType {
  collecting(0, 'Collect commission with price'),
  decreaseFromPrice(1, 'Decrease commission from price');

  final int value;
  final String description;

  const PaymentCommissionType(this.value, this.description);

  @override
  String toString() => description;

  static PaymentCommissionType fromString(String name) {
    switch (name) {
      case 'Collect commission with price':
        return collecting;
      case 'Decrease commission from price':
        return decreaseFromPrice;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}
