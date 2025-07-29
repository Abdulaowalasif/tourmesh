import 'package:flutter/material.dart';
import '../models/device.dart';
import 'home_screen.dart';

class DeviceDiscoveryScreen extends StatefulWidget {
  const DeviceDiscoveryScreen({super.key});

  @override
  State<DeviceDiscoveryScreen> createState() => _DeviceDiscoveryScreenState();
}

class _DeviceDiscoveryScreenState extends State<DeviceDiscoveryScreen>
    with TickerProviderStateMixin {
  late AnimationController _scanAnimationController;

  final List<Device> devices = [
    Device(id: '1', name: "John's Phone", signalStrength: 85, connected: true),
    Device(id: '2', name: "Sarah's Device", signalStrength: 72, connected: false),
    Device(id: '3', name: "Mike's Tablet", signalStrength: 91, connected: true),
    Device(id: '4', name: "Tour Guide Pro", signalStrength: 68, connected: false),
    Device(id: '5', name: "Lisa's Phone", signalStrength: 79, connected: true),
  ];

  @override
  void initState() {
    super.initState();
    _scanAnimationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _scanAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nearby Devices'),
            Text(
              'Scanning for TourMesh devices...',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _scanAnimationController,
                    builder: (context, child) {
                      return Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue.withOpacity(0.3),
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      );
                    },
                  ),
                  RotationTransition(
                    turns: _scanAnimationController,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.bluetooth,
                    size: 32,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  final device = devices[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.bluetooth,
                          color: Colors.grey,
                        ),
                      ),
                      title: Text(device.name),
                      subtitle: Row(
                        children: [
                          const Icon(Icons.signal_cellular_alt, size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text('${device.signalStrength}%'),
                          if (device.connected) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Connected',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: device.connected ? Colors.grey : Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(device.connected ? 'Connected' : 'Connect'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
