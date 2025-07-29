class Device {
  final String id;
  final String name;
  final int signalStrength;
  final bool connected;

  Device({
    required this.id,
    required this.name,
    required this.signalStrength,
    required this.connected,
  });
}
