
import 'package:flutter/material.dart';

import '../models/device.dart';

class DeviceTile extends StatelessWidget {
  final Device device;

  const DeviceTile({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.device_hub, color: Colors.teal),
        title: Text(device.name, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Row(
          children: [
            const Icon(Icons.signal_cellular_alt, size: 14, color: Colors.grey),
            const SizedBox(width: 4),
            Text('${device.signalStrength}%', style: const TextStyle(color: Colors.grey)),
          ],
        ),
        trailing: device.connected
            ? const Icon(Icons.check_circle, color: Colors.green, size: 20)
            : null,
      ),
    );
  }
}
