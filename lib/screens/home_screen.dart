import 'package:flutter/material.dart';
import '../models/device.dart';
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
      Device(id: '1', name: "John's Phone", signalStrength: 85, connected: true),
      Device(id: '3', name: "Mike's Tablet", signalStrength: 91, connected: true),
      Device(id: '5', name: "Lisa's Phone", signalStrength: 79, connected: true),
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
            _buildFeatureGrid(context),
            const SizedBox(height: 24),
            _buildLocationCard(context),
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

  Widget _buildFeatureGrid(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      children: [
        FeatureCard(
          icon: Icons.chat_bubble,
          title: '1-to-1 Chat',
          color: Colors.blue,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatScreen())),
        ),
        FeatureCard(
          icon: Icons.groups,
          title: 'Group Chat',
          color: Colors.green,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GroupChatScreen())),
        ),
        FeatureCard(
          icon: Icons.phone,
          title: 'Voice Calls',
          color: Colors.purple,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CallScreen())),
        ),
        FeatureCard(
          icon: Icons.folder_shared,
          title: 'File Share',
          color: Colors.orange,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FileTransferScreen())),
        ),
      ],
    );
  }

  Widget _buildLocationCard(BuildContext context) {
    return Card(
      color: Colors.red[50],
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: const Icon(Icons.location_on, color: Colors.red, size: 28),
        title: const Text('Location Sharing',
            style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: const Text('Share your location with the group'),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LocationScreen())),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 3,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: color.withOpacity(0.15),
                child: Icon(icon, size: 30, color: color),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
