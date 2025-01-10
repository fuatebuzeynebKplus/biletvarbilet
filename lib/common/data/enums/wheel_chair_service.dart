enum WheelChairServiceType {
  None(0, 'none'),
  WheelChairCarry(1, 'WCHC'),
  WheelChairRamp(2, 'WCHR'),
  WheelChairSteps(3, 'WCHS');

  final int value;
  final String description;

  const WheelChairServiceType(this.value, this.description);

  String toString() => description;

  static WheelChairServiceType fromString(String name) {
    switch (name) {
      case 'none':
        return None;
      case 'WCHC':
        return WheelChairCarry;
      case 'WCHR':
        return WheelChairRamp;
      case 'WCHS':
        return WheelChairSteps;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}
