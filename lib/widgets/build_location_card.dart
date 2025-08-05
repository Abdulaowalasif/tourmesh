
import 'package:flutter/material.dart';

import '../screens/location_screen.dart';

Widget buildLocationCard(BuildContext context) {
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
