
import 'package:flutter/material.dart';

Widget buildActionButton({
  required IconData icon,
  required String label,
  required Color color,
  required Color background,
  required VoidCallback onTap,
  required double iconSize,
  required double fontSize,
}) {
  return Column(
    children: [
      Material(
        color: background,
        shape: const CircleBorder(),
        child: IconButton(
          icon: Icon(icon),
          iconSize: iconSize,
          color: color,
          onPressed: onTap,
        ),
      ),
      const SizedBox(height: 6),
      Text(
        label,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}