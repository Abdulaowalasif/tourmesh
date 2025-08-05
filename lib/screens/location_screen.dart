import 'package:flutter/material.dart';
import '../models/device.dart';
import '../widgets/location_details_row.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool _locationSharing = false;

  final connectedDevices = [
    Device(id: '1', name: "John's Phone", signalStrength: 85, connected: true),
    Device(id: '3', name: "Mike's Tablet", signalStrength: 91, connected: true),
    Device(id: '5', name: "Lisa's Phone", signalStrength: 79, connected: true),
  ];

  @override
  Widget build(BuildContext context) {
    final int sharedDeviceCount = connectedDevices.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // Match HomeScreen background
      appBar: AppBar(
        title: const Text('Location Sharing'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87, // black text color
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // Location sharing toggle card
            Card(
              color: Colors.white,
              elevation: 2,
              shadowColor: Colors.black.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Share Live Location',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Let others see your real-time location',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 14),
                          ),
                          if (_locationSharing)
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_circle,
                                      color: Colors.green, size: 18),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Sharing with $sharedDeviceCount device${sharedDeviceCount > 1 ? 's' : ''}',
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    Switch(
                      activeColor: Colors.green,
                      value: _locationSharing,
                      onChanged: (value) {
                        setState(() {
                          _locationSharing = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Map view card
            Card(
              color: Colors.white,
              elevation: 2,
              shadowColor: Colors.black.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.only(bottom: 16),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map, size: 48, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        'Map View',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Interactive map would appear here',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Location details card
            Card(
              color: Colors.white,
              elevation: 2,
              shadowColor: Colors.black.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.only(bottom: 16),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Column(
                  children: [
                    LocationDetailRow(label: 'Latitude:', value: '40.7128° N'),
                    SizedBox(height: 8),
                    LocationDetailRow(label: 'Longitude:', value: '74.0060° W'),
                    SizedBox(height: 8),
                    LocationDetailRow(label: 'Accuracy:', value: '±5 meters'),
                  ],
                ),
              ),
            ),

            // Group Locations header
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Group Locations',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
              ),
            ),
            const SizedBox(height: 12),

            // Device list expanded
            Expanded(
              child: ListView.builder(
                itemCount: connectedDevices.length,
                itemBuilder: (context, index) {
                  final device = connectedDevices[index];
                  return Card(
                    color: Colors.white,
                    elevation: 1,
                    shadowColor: Colors.black.withOpacity(0.05),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const Icon(Icons.location_on,
                          color: Colors.red, size: 28),
                      title: Text(device.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87)),
                      subtitle: const Text('0.2 km away',
                          style: TextStyle(color: Colors.grey)),
                      trailing: OutlinedButton(
                        onPressed: () {
                          // TODO: Show map/detail for this device
                        },
                        child: const Text('View'),
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
