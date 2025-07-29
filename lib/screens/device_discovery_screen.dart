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
    )..repeat(); // repeats forever
  }

  @override
  void dispose() {
    _scanAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(
        title: 'Nearby Devices',
        subtitle: 'Scanning for TourMesh devices...',
        avatarText: 'D',
        onCallPressed: () {
          // You could add an action here or leave empty
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Infinite circular progress indicator border
                    CircularProgressIndicator(
                      strokeWidth: 4,
                      color: Colors.blue,
                      backgroundColor: Colors.blue.withOpacity(0.3),
                      value: null, // null for infinite progress
                    ),
                    // Fixed bluetooth icon in center
                    const Icon(
                      Icons.bluetooth,
                      size: 32,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  final device = devices[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(1, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.bluetooth,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                device.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.signal_cellular_alt,
                                      size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${device.signalStrength}%',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  if (device.connected) ...[
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Text(
                                        'Connected',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: device.connected
                              ? null
                              : () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => const HomeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            device.connected ? Colors.grey[400] : Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          child:
                          Text(device.connected ? 'Connected' : 'Connect'),
                        ),
                      ],
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final String avatarText;
  final VoidCallback onCallPressed;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subtitle,
    required this.avatarText,
    required this.onCallPressed,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: const TextStyle(fontSize: 14, color: Colors.green),
            ),
        ],
      ),
      actions: [
        if (actions != null) ...actions!,
        IconButton(
          icon: const Icon(Icons.refresh, color: Colors.blue),
          onPressed: () {
            // Optionally add scan refresh functionality
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
