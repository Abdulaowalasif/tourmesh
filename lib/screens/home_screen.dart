import 'package:flutter/material.dart';
import '../models/device.dart';
import '../widgets/build_feature_grid.dart';
import '../widgets/build_location_card.dart';
import '../widgets/device_tile.dart';
import '../widgets/feature_card.dart';
import 'chat_screen.dart';
import 'group_chat_screen.dart';
import 'call_screen.dart';
import 'file_transfer_screen.dart';
import 'location_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final connectedDevices = [
      Device(
          id: '1', name: "John's Phone", signalStrength: 85, connected: true),
      Device(
          id: '3', name: "Mike's Tablet", signalStrength: 91, connected: true),
      Device(
          id: '5', name: "Lisa's Phone", signalStrength: 79, connected: true),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('TourMesh',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text('${connectedDevices.length} connected',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13)),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.black87),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            buildFeatureGrid(context),
            const SizedBox(height: 24),
            buildLocationCard(context),
            const SizedBox(height: 32),
            Text(
              'Connected Devices',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(height: 12),
            ...connectedDevices.map((device) => DeviceTile(device: device)),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
