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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('TourMesh'),
            Text(
              '${connectedDevices.length} devices connected',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildFeatureCard(
                  context,
                  icon: Icons.message,
                  title: '1-to-1 Chat',
                  subtitle: 'Direct messaging',
                  color: Colors.blue,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatScreen()),
                  ),
                ),
                _buildFeatureCard(
                  context,
                  icon: Icons.group,
                  title: 'Group Chat',
                  subtitle: 'Broadcast messages',
                  color: Colors.green,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GroupChatScreen()),
                  ),
                ),
                _buildFeatureCard(
                  context,
                  icon: Icons.phone,
                  title: 'Calls',
                  subtitle: 'Voice communication',
                  color: Colors.purple,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CallScreen()),
                  ),
                ),
                _buildFeatureCard(
                  context,
                  icon: Icons.folder,
                  title: 'File Share',
                  subtitle: 'Transfer files',
                  color: Colors.orange,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FileTransferScreen()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.red),
                title: const Text('Location Sharing'),
                subtitle: const Text('Share your location with the group'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LocationScreen()),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Connected Devices',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: connectedDevices.length,
                itemBuilder: (context, index) {
                  final device = connectedDevices[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      title: Text(device.name),
                      trailing: Text('${device.signalStrength}%'),
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

  Widget _buildFeatureCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required Color color,
        required VoidCallback onTap,
      }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
