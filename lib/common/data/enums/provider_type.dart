enum ProviderType {
  all(0, 'All'),
  charter(1, 'Charter'),
  service(2, 'Service');

  final int value;
  final String description;

  const ProviderType(this.value, this.description);

  String toString() => description;

  static ProviderType fromString(String name) {
    switch (name) {
      case 'All':
        return all;
      case 'Charter':
        return charter;
      case 'Service':
        return service;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}
