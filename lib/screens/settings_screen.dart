import 'package:flutter/material.dart';
import '../models/device.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _encryptionEnabled = true;

  final connectedDevices = [
    Device(id: '1', name: "John's Phone", signalStrength: 85, connected: true),
    Device(id: '3', name: "Mike's Tablet", signalStrength: 91, connected: true),
    Device(id: '5', name: "Lisa's Phone", signalStrength: 79, connected: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // consistent background
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildEncryptionCard(),
            const SizedBox(height: 16),
            _buildConnectedDevicesCard(),
            const SizedBox(height: 16),
            _buildStorageUsageCard(),
            const SizedBox(height: 16),
            _buildAppInfoCard(),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red.shade700,
                  side: BorderSide(color: Colors.red.shade700),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  // Reset app logic here
                },
                icon: const Icon(Icons.power_settings_new),
                label: const Text('Reset App'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEncryptionCard() {
    return Material(
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.1),
      borderRadius: BorderRadius.circular(18),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          children: [
            const Icon(Icons.security, color: Colors.green, size: 28),
            const SizedBox(width: 20),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Encryption',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'End-to-end encryption for messages',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Switch(
              value: _encryptionEnabled,
              onChanged: (value) {
                setState(() {
                  _encryptionEnabled = value;
                });
              },
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConnectedDevicesCard() {
    return Material(
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.1),
      borderRadius: BorderRadius.circular(18),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Connected Devices',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            ...connectedDevices.map(
                  (device) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.6),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        device.name,
                        style: const TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red.shade700,
                        side: BorderSide(color: Colors.red.shade700),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        // Disconnect logic here
                      },
                      icon: const Icon(Icons.link_off),
                      label: const Text('Disconnect'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorageUsageCard() {
    return Material(
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.1),
      borderRadius: BorderRadius.circular(18),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.storage, color: Colors.green, size: 28),
                SizedBox(width: 16),
                Text(
                  'Storage Usage',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildStorageRow('Messages', '2.4 MB'),
            _buildStorageRow('Files', '15.7 MB'),
            _buildStorageRow('Cache', '3.1 MB'),
            const Divider(height: 32, thickness: 1.2),
            _buildStorageRow(
              'Total',
              '21.2 MB',
              isBold: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorageRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: Colors.black87),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildAppInfoCard() {
    return Material(
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.1),
      borderRadius: BorderRadius.circular(18),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.info_outline, color: Colors.grey, size: 28),
                SizedBox(width: 16),
                Text(
                  'App Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Version', '1.0.0'),
            _buildInfoRow('Build', '2024.01.15'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, color: Colors.black87)),
          Text(value, style: const TextStyle(fontSize: 16, color: Colors.black87)),
        ],
      ),
    );
  }
}
