
import 'package:flutter/material.dart';

class LocationDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const LocationDetailRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[600])),
        Text(value, style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.w500, color: Colors.black87)),
      ],
    );
  }
}
