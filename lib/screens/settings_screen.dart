import 'package:flutter/material.dart';
import '../models/device.dart';
import '../widgets/build_app_info_card.dart';
import '../widgets/build_connected_device_card.dart';
import '../widgets/build_encryption_card.dart';
import '../widgets/build_storage_usage_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _encryptionEnabled = true;

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
            EncryptionCard(
              encryptionEnabled: _encryptionEnabled,
            ),
            const SizedBox(height: 16),
            buildConnectedDevicesCard(),
            const SizedBox(height: 16),
            buildStorageUsageCard(),
            const SizedBox(height: 16),
            buildAppInfoCard(),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red.shade700,
                  side: BorderSide(color: Colors.red.shade700),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
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
}
